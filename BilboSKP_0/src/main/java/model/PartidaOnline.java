package model;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.Vector;

public class PartidaOnline extends Partida {
	private static final String PARTIDA_ORGANIZANDO = "Organizando";
	private static final String PARTIDA_EN_CURSO = "En Curso";
	private static final String PARTIDA_FINALIZANDO = "Finalizando";
	private String estado;
	private int codInvitacion;
	private Vector<Jugador> vectorJugadores = new Vector<Jugador>();

	private static HashMap<Integer, PartidaOnline> partidasOrganizando = new HashMap<Integer, PartidaOnline>();

	// el sistema usará este constructor para el inicio de una nueva partida
	public PartidaOnline(Socket socketAnfitrion, Sala sala, Suscriptor anfitrion, int numJugadores, String nombreGrupo) {
		super(sala, anfitrion, numJugadores, nombreGrupo);
		this.estado = PARTIDA_ORGANIZANDO;
		this.codInvitacion = generarCodInvitacion();
		partidasOrganizando.put(this.codInvitacion, this);
		agregarJugador(new Jugador(anfitrion.getAlias(), true));
	}
	// el sistema usará este constructor para recibir una partida online jugada desde la base de datos
	public PartidaOnline(Sala sala, Suscriptor anfitrion, int idPartida, int puntaje, int numJugadores,
			String nombreGrupo, Date fechaInicio, Date fechaFin) {
		super(sala, anfitrion, idPartida, puntaje, numJugadores, nombreGrupo, fechaInicio, fechaFin);
	}

	public void agregarJugador(Jugador jugador) {
		if (vectorJugadores.size() < this.getSala().getJugadoresMax()) {
			vectorJugadores.add(jugador);
		} else {
			System.out.println("Sala "+codInvitacion+" llena");
		}

	}

	public Vector<Jugador> getJugadores() {
		return vectorJugadores;
	}

	public static int generarCodInvitacion() {
		Random rand = new Random();
		int invite = rand.nextInt(9000) + 1000; // Generates a random number between 1000 and 9999
		while (partidasOrganizando.containsKey(invite)) {
			invite = rand.nextInt(9000) + 1000; // Generates a new random number if the current one already exists
		}
		return invite;
	}
	
	public void iniciarPartida() {
		//quitar la partida de la coleccion de partidas en organizando
		partidasOrganizando.remove(codInvitacion);
		//establecer el estado de partida a "en curso"
		this.estado = PartidaOnline.PARTIDA_EN_CURSO;
		//establecer el estado del cupón a en "en uso" para el cupón con la caducidad máx próxima
		
		//mandar a todos los jugadores al escenario inicial correspondiente a la sala
	}
	public void finalizarPartida() {
		//establecer el estado de finalizando partida
		this.estado = PartidaOnline.PARTIDA_FINALIZANDO;
		
		//calcular el puntaje
		
		//calcular el tiempo que se ha completado
		
		
	}
	public void cancelarPartida() {
		partidasOrganizando.remove(codInvitacion);
	}
}
