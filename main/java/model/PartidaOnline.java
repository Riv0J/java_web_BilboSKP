package model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import control.BilboSKP;

public class PartidaOnline extends Partida {
	public static final int TIMEOUT_SECONDS = 120;
	public static final String PARTIDA_ORGANIZANDO = "Organizando";
	public static final String PARTIDA_EN_CURSO = "En Curso";
	public static final String PARTIDA_FINALIZANDO = "Finalizando";
	private int visibleRanking;
	private String estado;
	private int codInvitacion;
	private Vector<HttpSession> vectorJugadores;
	private Vector<Pista> vectorpistasUtilizadas;
	private Inventario inventario;
	private Timer timer;
	int segundosTranscurridos = 0;
	int segundosObjetivo = 0;
	private static HashMap<Integer, PartidaOnline> partidasOrganizando = new HashMap<Integer, PartidaOnline>();
	private static HashMap<Integer, PartidaOnline> partidasEnCurso = new HashMap<Integer, PartidaOnline>();
	private Vector<MensajeChat> lineasChat;
	private boolean superada = false;
	private Cupon cupon;

	// el sistema usara este constructor para el inicio de una nueva partida
	public PartidaOnline(Sala sala, Suscriptor suscriptorAnfitrion, HttpSession sesionAnfitrion, int numJugadores,
			String nombreGrupo) {
		super(sala, suscriptorAnfitrion, numJugadores, nombreGrupo);
		timer = new Timer();
		this.vectorJugadores = new Vector<HttpSession>();
		this.vectorpistasUtilizadas = new Vector<Pista>();
		this.setLineasChat(new Vector<MensajeChat>());
		this.addChat(new Jugador("Sistema", null),"Este es el chat de la partida, ¡comunícate con los demas jugadores!");
		this.estado = PARTIDA_ORGANIZANDO;
		this.codInvitacion = generarCodInvitacion();
		this.setInventario(new Inventario());
		partidasOrganizando.put(this.codInvitacion, this);
		agregarJugador(sesionAnfitrion);
		iniciarTimer();
	}

	// el sistema usara este constructor para recibir una partida online jugada
	// desde la base de datos
	public PartidaOnline(Sala sala, Suscriptor anfitrion, int idPartida, int puntaje, int numJugadores,
			String nombreGrupo, Date fechaInicio, Date fechaFin, int visibleRanking) {
		super(sala, anfitrion, idPartida, puntaje, numJugadores, nombreGrupo, fechaInicio, fechaFin);
		setVisibleRanking(visibleRanking);
	}

	// un cliente proporciona un codigo, y la clase PartidaOnline determinará si se
	public static PartidaOnline usarCodigoInvitacion(int codProporcionado) {
		// si se encuentra una partida organizando en el hashmap con el codProporcionado
		return partidasOrganizando.get(codProporcionado);
	}

	public static PartidaOnline getPartidaOrganizando(int codInvitacion) {
		return usarCodigoInvitacion(codInvitacion);
	}

	public static PartidaOnline getPartidaEnCurso(int codInvitacion) {
		return partidasEnCurso.get(codInvitacion);
	}

	public String agregarJugador(HttpSession sesion) {
		if(this.estado.equals(PARTIDA_EN_CURSO)) {
			return "Comenzada";
		}
		// asegurarse que no se sobrepase el maximo de la sala
		if (vectorJugadores.size() < this.getSala().getJugadoresMax()) {
			// checar de que la sesion por agregar no esté ya en el vector
			if (!vectorJugadores.contains(sesion)) {
				vectorJugadores.add(sesion);
				System.out.println("PO: Nuevo jugador agregado a la partida "+getCodInvitacion());
				return "Agregado";
			} else {
				System.out.println("PO: Sesión no agregada; repetida");
				return "Ya estaba agregado";
			}
		} else {
			System.out.println("PO: Sala " + this.codInvitacion + " llena");
		}
		return "Lleno";
	}

	public boolean quitarJugador(HttpSession sesion) {
		for (int i = 0; i < vectorJugadores.size(); i++) {
			HttpSession sesionJugadora = vectorJugadores.get(i);
			if (sesionJugadora.equals(sesion)) {
				System.out.println("PO: Se ha encontrado el jugador, se procederá a quitarlo");
				vectorJugadores.remove(i);
				return true;
			}
		}
		System.out.println("PO: No se ha encontrado ese jugador en el vector jugadores");
		return false;
	}

	public Vector<HttpSession> getJugadores() {
		return vectorJugadores;
	}

	public static int generarCodInvitacion() {
		Random rand = new Random();
		// generar num aleatorio entre 1000 y 9999
		int invite = rand.nextInt(9000) + 1000;
		while (partidasOrganizando.containsKey(invite)) {
			// generar otro numero alreatorio si el hashmap ya contiene ese numero, bucle
			invite = rand.nextInt(9000) + 1000;
		}
		return invite;
	}

	public boolean iniciarPartida() {
		// asegurarse antes de iniciar, que los jugadores son más o igual al minimo
		// requerido por la sala
		if (vectorJugadores.size() >= this.getSala().getJugadoresMin()) {
			// quitar la partida de la coleccion de partidas en organizando
			partidasOrganizando.remove(codInvitacion);
			// establecer el estado de partida a "en curso"
			this.estado = PartidaOnline.PARTIDA_EN_CURSO;
			// colocar la partida en otro mapa de partidas en curso
			partidasEnCurso.put(codInvitacion, this);
			// establecer el tiempo de inicio de la partida
			this.fechaInicio = new Date();
			// iniciar el timer
			iniciarTimer();
			System.out.println("PO "+this.getCodInvitacion()+": El anfitrion ha iniciado la partida");
			return true;
		}
		System.out.println("No se cumplen los jugadores mínimos para iniciar la partida");
		return false;
	}

	public PartidaOnline finalizarPartida() {
		// quitar la partida de la coleccion de partidas en organizando
		partidasOrganizando.remove(codInvitacion);
		
		// quitar la partida de la coleccion de partidas en curso
		partidasEnCurso.remove(codInvitacion);
		
		// establecer el tiempo de fin de la partida
		this.fechaFin = new Date();

		// calcular y establecer el tiempo que se ha completado
		this.setTiempoMinutos(this.calcularTiempo());

		// establecer el puntaje de la partida
		this.setPuntaje(calcularPuntaje());
		System.out.println("Puntaje de partida="+this.getPuntaje());
		// guardar la partida online en la bd si estaba en curso
		if(getEstado().equals(PartidaOnline.PARTIDA_EN_CURSO)) {
			BilboSKP.guardarPartidaOnline(this);
			// guardar los jugadores suscriptores como participantes de la partida online
			for (HttpSession httpSession : vectorJugadores) {
				try {
					Object jugador = (Object) httpSession.getAttribute("jugador");
					if (jugador instanceof Invitado) {
						Suscriptor suscriptorInvitado = ((Invitado) jugador).getSuscriptor();
						if (suscriptorInvitado != null) {
							BilboSKP.agregarSuscriptorParticipante(suscriptorInvitado.getIdSuscriptor(), 1);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}
		} else {
			System.out.println("PO: NO se han guardado los datos en la bd, porque la partida se ha cancelado.");
		}
		// establecer el estado de finalizando partida
		this.estado = PartidaOnline.PARTIDA_FINALIZANDO;
		System.out.println("PO "+this.getCodInvitacion()+": Ha finalizado la partida.");
		return this;
	}

	public void cancelarPartida() {
		// quitar la partida de la coleccion de partidas en organizando
		partidasOrganizando.remove(codInvitacion);

		// establecer el estado
		this.estado = PARTIDA_FINALIZANDO;
		// quitar de las sesiones los objetos jugador(invitados y anfitrion)
		for (HttpSession sesion : vectorJugadores) {
			sesion.removeAttribute("jugador");
		}
		System.out.println("PO: Se ha cancelado la partida");
		try {
			this.finalizarPartida();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public int calcularPuntaje() {
		int puntajeBase = 0;
		int penalizacionPistas = calcularPenalizacionPistas();
		int puntajeBonus = 0;
		if (superada == true) {
			System.out.println("SALA SUPERADA!!!");
			puntajeBonus = calcularPuntajeBonus();
			puntajeBonus += 8000;
		}
		int puntajeTotal = puntajeBase - penalizacionPistas + puntajeBonus;
		if (puntajeTotal < 0) {
			puntajeTotal = 0;
		}
		return puntajeTotal;
	}

	public void superarPartida() {
		setSuperada(true);
	}

	public int calcularPenalizacionPistas() {
		int penalizacionPistas = 0;
		for (Pista pista : vectorpistasUtilizadas) {
			penalizacionPistas += pista.getPenalizacion();
		}
		return penalizacionPistas;
	}

	public int calcularPuntajeBonus() {
		int puntaje = (getSala().getTiempoMax()*60 - calcularTiempoSegundos());
		return puntaje;
	}

	public int getVisibleRanking() {
		return visibleRanking;
	}

	public void setVisibleRanking(int visibleRanking) {
		this.visibleRanking = visibleRanking;
	}

	public int getCodInvitacion() {
		return codInvitacion;
	}

	public void setCodInvitacion(int codInvitacion) {
		this.codInvitacion = codInvitacion;
	}

	public void iniciarTimer() {
		setSegundosObjetivo();
		timer.cancel();
		timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				// Incrementa los segundos cada segundo
				segundosTranscurridos++;
				switch (estado) {
				case PARTIDA_ORGANIZANDO:
					System.out.println("PO: Partida organizándose: " + segundosTranscurridos);
					break;
				case PARTIDA_EN_CURSO:
					System.out.println("PO: Partida en curso: " + segundosTranscurridos);
					break;

				default:
					break;
				}
				if (segundosTranscurridos >= segundosObjetivo && estado.equals(PARTIDA_ORGANIZANDO)) {
					segundosTranscurridos = 0;
					cancelarPartida(); // Ejecuta el método si se ha llegado al número variable de segundos
					timer.cancel(); // Cancela el timer después de alcanzar el objetivo
				}
				if (segundosTranscurridos >= segundosObjetivo) {
					segundosTranscurridos = 0;
					finalizarPartida(); // Ejecuta el método si se ha llegado al número variable de segundos
					timer.cancel(); // Cancela el timer después de alcanzar el objetivo
				}
				// cada 5 segundos, este timer se asegura que la sesion del anfitrión esta
				// activa, y si no lo está cancela la partida en curso
				if (segundosTranscurridos % 5 == 0) {
					HttpSession sesionAnfitrion = getSessionJugadorAnfitrion();
					long tiempoInactivo = System.currentTimeMillis() - sesionAnfitrion.getLastAccessedTime();
					int tiempoEspera = TIMEOUT_SECONDS * 1000; // convertir a milisegundos
					if (tiempoInactivo > tiempoEspera) {
						// System.out.println("La sesión anfitriona ha expirado. Cancelando la partida
						// en curso");
						cancelarPartida();
						timer.cancel();
					}
				}
			}
		}, 0, 1000); // El segundo parámetro especifica el retraso antes de iniciar el timer, y el
						// tercer parámetro especifica el intervalo de tiempo entre cada ejecución del
						// timer (en milisegundos)
	}

	private void setSegundosObjetivo() {
		switch (this.estado) {
		case PartidaOnline.PARTIDA_ORGANIZANDO:
			segundosObjetivo = 20 * 60;
			break;
		case PartidaOnline.PARTIDA_EN_CURSO:
			int tiempoMaxSala = this.getSala().getTiempoMax();
			segundosObjetivo = tiempoMaxSala * 60;
			break;
		default:
			break;
		}
	}

	public static PartidaOnline buscarPartidaPorAlias(String alias) {
		for (Map.Entry<Integer, PartidaOnline> par : partidasOrganizando.entrySet()) {
			PartidaOnline po = par.getValue();
			if (po.getAnfitrion().getAlias().equals(alias)) {
				return po;
			}
		}
		return null;
	}

	public static void cancelarPartida(String alias) {
		for (Map.Entry<Integer, PartidaOnline> par : partidasOrganizando.entrySet()) {
			PartidaOnline po = par.getValue();
			if (po.getAnfitrion().getAlias().equals(alias)) {
				po.cancelarPartida();
			}
		}
	}

	public static void cancelarPartida(int codInvitacion) {
		PartidaOnline po = partidasOrganizando.get(codInvitacion);
		if (po != null) {
			po.cancelarPartida();
		}
	}

	public HttpSession getSessionJugadorAnfitrion() {
		return vectorJugadores.get(0);
	}

	public Vector<MensajeChat> getLineasChat() {
		return lineasChat;
	}

	private void setLineasChat(Vector<MensajeChat> lineasChat) {
		this.lineasChat = lineasChat;
	}
	
	public void addChat(Jugador jugador, String texto) {
		lineasChat.add(new MensajeChat(jugador, texto));
	}

	public Inventario getInventario() {
		return inventario;
	}

	public void setInventario(Inventario inventario) {
		this.inventario = inventario;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Vector<HttpSession> getVectorJugadores() {
		return vectorJugadores;
	}

	public void setVectorJugadores(Vector<HttpSession> vectorJugadores) {
		this.vectorJugadores = vectorJugadores;
	}

	public Vector<Pista> getVectorpistasUtilizadas() {
		return vectorpistasUtilizadas;
	}

	public void setVectorpistasUtilizadas(Vector<Pista> vectorpistasUtilizadas) {
		this.vectorpistasUtilizadas = vectorpistasUtilizadas;
	}

	public Timer getTimer() {
		return timer;
	}

	public void setTimer(Timer timer) {
		this.timer = timer;
	}

	public int getSegundosTranscurridos() {
		return segundosTranscurridos;
	}

	public void setSegundosTranscurridos(int segundosTranscurridos) {
		this.segundosTranscurridos = segundosTranscurridos;
	}

	public int getSegundosObjetivo() {
		return segundosObjetivo;
	}

	public void setSegundosObjetivo(int segundosObjetivo) {
		this.segundosObjetivo = segundosObjetivo;
	}

	public boolean isSuperada() {
		return superada;
	}

	public void setSuperada(boolean superada) {
		this.superada = superada;
	}

	public void setCupon(Cupon cupon) {
		this.cupon = cupon;
	}
	public Cupon getCupon() {
		return cupon;
	}
}
