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
	private static final String PARTIDA_ORGANIZANDO = "Organizando";
	private static final String PARTIDA_EN_CURSO = "En Curso";
	private static final String PARTIDA_FINALIZANDO = "Finalizando";
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

	// el sistema usara este constructor para el inicio de una nueva partida
	public PartidaOnline(Sala sala, Suscriptor suscriptorAnfitrion, HttpSession sesionAnfitrion, int numJugadores, String nombreGrupo) {
		super(sala, suscriptorAnfitrion, numJugadores, nombreGrupo);
		timer = new Timer();
		this.vectorJugadores = new Vector<HttpSession>();
		this.vectorpistasUtilizadas = new Vector<Pista>();
		this.estado = PARTIDA_ORGANIZANDO;
		this.codInvitacion = generarCodInvitacion();
		this.inventario = new Inventario();

		partidasOrganizando.put(this.codInvitacion, this);
		agregarJugador(sesionAnfitrion);
		System.out.println(vectorJugadores.size());
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
		PartidaOnline po = partidasOrganizando.get(codProporcionado);
		return po;
	}

	public String agregarJugador(HttpSession sesion) {
	    //asegurarse que no se sobrepase el maximo de la sala
	    if (vectorJugadores.size() < this.getSala().getJugadoresMax()) {
	        //checar de que la sesion por agregar no esté ya en el vector
	        if (!vectorJugadores.contains(sesion)) {
	            vectorJugadores.add(sesion);
	            System.out.println("Nuevo jugador agregado");
	            return "Agregado";
	        } else {
	            System.out.println("Sesión no agregada; repetida");
	            return "Ya estaba agregado";
	        }
	    } else {
	        System.out.println("Sala "+this.codInvitacion+" llena");
	    }
	    return "Lleno";
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

	public boolean iniciarPartida(HttpServletRequest requestAnfitrion) {
		// asegurarse antes de iniciar, que los jugadores son más o igual al minimo
		// requerido por la sala
		if (vectorJugadores.size() >= this.getSala().getJugadoresMin()) {
			// quitar la partida de la coleccion de partidas en organizando
			partidasOrganizando.remove(codInvitacion);
			// establecer el estado de partida a "en curso"
			this.estado = PartidaOnline.PARTIDA_EN_CURSO;
			// establecer el tiempo de inicio de la partida
			this.fechaInicio = new Date();
			//iniciar el timer
			iniciarTimer();
			// establecer el estado del cupón del anfitrion a en "en uso" para el cupón con
			// la caducidad máx próxima
			// mandar a todos los jugadores al escenario inicial correspondiente a la sala
			System.out.println("Se ha iniciado una partida online");
			return true;
		}
		System.out.println("No se cumplen los jugadores mínimos para iniciar la partida");
		return false;
	}

	public void finalizarPartida() throws Throwable {
		// quitar la partida de la coleccion de partidas en organizando
		partidasOrganizando.remove(codInvitacion);

		// establecer el estado de finalizando partida
		this.estado = PartidaOnline.PARTIDA_FINALIZANDO;

		// establecer el tiempo de fin de la partida
		this.fechaFin = new Date();

		// calcular y establecer el tiempo que se ha completado
		this.setTiempoMinutos(this.calcularTiempo());

		// establecer el puntaje de la partida
		this.setPuntaje(calcularPuntaje());

		// guardar la partida online en la base de datos
		BilboSKP.guardarPartidaOnline(this);

		//guardar los jugadores suscriptores como participantes de la partida online
		for (HttpSession httpSession : vectorJugadores) {
			try {
				Object jugador = (Object) httpSession.getAttribute("jugador");
				if (jugador instanceof Invitado) {
					Suscriptor suscriptorInvitado = ((Invitado) jugador).getSuscriptor();
					if (suscriptorInvitado!=null) {
						BilboSKP.agregarSuscriptorParticipante(suscriptorInvitado.getIdSuscriptor(),1);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
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
		System.out.println("Se ha cancelado la partida");
		try {
			this.finalizarPartida();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public int calcularPuntaje() {
		int puntajeBase = 0;
		int penalizacionPistas = calcularPenalizacionPistas();
		int puntajeBonus = calcularPuntajeBonus();
		System.out.println(puntajeBonus);
		int puntajeTotal = puntajeBase - penalizacionPistas + puntajeBonus;
		if (puntajeTotal < 0) {
			puntajeTotal = 0;
		}
		return puntajeTotal;
	}
	public int calcularPenalizacionPistas() {
		int penalizacionPistas = 0;
		for (Pista pista : vectorpistasUtilizadas) {
			penalizacionPistas += pista.getPenalizacion();
		}
		return penalizacionPistas;
	}
	
	public int calcularPuntajeBonus() {
		System.out.println(getSala().getTiempoMax()+" - "+getTiempoMinutos());
		return (getSala().getTiempoMax() - getTiempoMinutos()) * 60;
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
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				// Incrementa los segundos cada segundo
				segundosTranscurridos++;
				System.out.println("Segundos en organizando: " + segundosTranscurridos);
				if (segundosTranscurridos >= segundosObjetivo || estado.equals(PARTIDA_FINALIZANDO)) {
					segundosTranscurridos = 0;
					cancelarPartida(); // Ejecuta el método si se ha llegado al número variable de segundos
					timer.cancel(); // Cancela el timer después de alcanzar el objetivo
				}
				//cada 5 segundos, este timer se asegura que la sesion del anfitrión esta activa, y si no lo está cancela la partida en curso
				 if (segundosTranscurridos % 5 == 0) {
			         HttpSession sesionAnfitrion = getSessionJugadorAnfitrion();
			         long tiempoInactivo = System.currentTimeMillis() - sesionAnfitrion.getLastAccessedTime();
			         int tiempoEspera = sesionAnfitrion.getMaxInactiveInterval() * 1000; // convertir a milisegundos
			         if (tiempoInactivo > tiempoEspera) {
			             //System.out.println("La sesión anfitriona ha expirado. Cancelando la partida en curso");
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
	
	public HttpSession getSessionJugadorAnfitrion() {
		return vectorJugadores.get(0);
	}
}
