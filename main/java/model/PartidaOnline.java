package model;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;
import java.util.concurrent.TimeUnit;

import control.BilboSKP;

public class PartidaOnline extends Partida {
	private static final String PARTIDA_ORGANIZANDO = "Organizando";
	private static final String PARTIDA_EN_CURSO = "En Curso";
	private static final String PARTIDA_FINALIZANDO = "Finalizando";
	private int visibleRanking;
	private String estado;
	private int codInvitacion;
	private Vector<Jugador> vectorJugadores;
	private Vector<Pista> vectorpistasUtilizadas;
	private Inventario inventario;
	private Timer timer;
	int segundosTranscurridos = 0;
	int segundosObjetivo = 0;
	private static HashMap<Integer, PartidaOnline> partidasOrganizando = new HashMap<Integer, PartidaOnline>();

	// el sistema usara este constructor para el inicio de una nueva partida
	public PartidaOnline(Sala sala, Suscriptor suscriptorAnfitrion, int numJugadores, String nombreGrupo) {
		super(sala, suscriptorAnfitrion, numJugadores, nombreGrupo);
		timer = new Timer();
		this.vectorJugadores = new Vector<Jugador>();
		this.vectorpistasUtilizadas = new Vector<Pista>();
		this.estado = PARTIDA_ORGANIZANDO;
		this.codInvitacion = generarCodInvitacion();
		this.inventario = new Inventario();

		partidasOrganizando.put(this.codInvitacion, this);
		Anfitrion anfitrion = new Anfitrion(suscriptorAnfitrion.getAlias());
		agregarJugador(anfitrion);
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
	public static boolean usarCodigoInvitacion(int codProporcionado) {
		// si se encuentra una partida organizando en el hashmap con el codProporcionado
		// devuelve true, de lo contrario false;
		if (partidasOrganizando.containsKey(codProporcionado)) {
			return true;
		}
		return false;
	}

	public boolean agregarJugador(Jugador jugador) {
		// asegurarse de que el tamaño del vector de jugadores de la partida no exceda
		// el
		// max de jugadores
		if (vectorJugadores.size() < this.getSala().getJugadoresMax()) {
			vectorJugadores.add(jugador);
			System.out.println("Jugador agregado con éxito");
			return true;
		} else {
			System.out.println("Sala " + codInvitacion + " llena");
			return false;
		}

	}

	public Vector<Jugador> getJugadores() {
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
			// establecer el tiempo de inicio de la partida
			this.fechaInicio = new Date();
			// establecer el estado del cupón del anfitrion a en "en uso" para el cupón con
			// la caducidad máx próxima
			// mandar a todos los jugadores al escenario inicial correspondiente a la sala
			System.out.println("Se ha iniciado una partida online");
			return true;
		}
		System.out.println("No se cumplen los jugadores mínimos para iniciar la partida");
		return false;
	}

	public void finalizarPartida() {
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

		// TODO guardar los jugadores suscriptores como participantes de la partida
		// online
	}

	public void cancelarPartida() {
		// quitar la partida de la coleccion de partidas en organizando
		partidasOrganizando.remove(codInvitacion);

		// establecer el estado
		this.estado = PARTIDA_FINALIZANDO;
		// quitar de las sesiones los objetos jugador(invitados y anfitrion)
	}

	public int calcularPuntaje() {
		int puntaje = 0;
		if (puntaje < 0) {
			puntaje = 0;
		}
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
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				// Incrementa los segundos cada segundo
				segundosTranscurridos++;
				System.out.println("Segundos: " + segundosTranscurridos);
				if (segundosTranscurridos == segundosObjetivo || estado.equals(PARTIDA_FINALIZANDO)) {
					segundosTranscurridos = 0;
					cancelarPartida(); // Ejecuta el método si se ha llegado al número variable de segundos
					timer.cancel(); // Cancela el timer después de alcanzar el objetivo
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

	public static void cancelarPartida(String aliasCerrandoSesion) {
		for (Map.Entry<Integer, PartidaOnline> par : partidasOrganizando.entrySet()) {
			PartidaOnline po = par.getValue();
			if (po.getAnfitrion().getAlias().equals(aliasCerrandoSesion)) {
				po.cancelarPartida();
			}
		}
	}
}
