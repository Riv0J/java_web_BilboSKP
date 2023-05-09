package model;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Partida {
	private Suscriptor anfitrion;
	private Sala sala;
	private int idPartida, puntaje, numJugadores;
	private String nombreGrupo;
	Date fechaInicio, fechaFin;
	private int tiempoMinutos;

	// el sistema usará este constructor para el inicio de una partida
	public Partida(Sala sala, Suscriptor anfitrion, int numJugadores, String nombreGrupo) {
		this.sala = sala;
		this.anfitrion = anfitrion;
		this.numJugadores = numJugadores;
		this.nombreGrupo = nombreGrupo;
	}

	// el sistema usará este constructor para cargar una partida guardada en la base
	// de datos
	public Partida(Sala sala, Suscriptor anfitrion, int idPartida, int puntaje, int numJugadores, String nombreGrupo,
			Date fechaInicio, Date fechaFin) {
		super();
		this.sala = sala;
		this.anfitrion = anfitrion;
		this.idPartida = idPartida;
		this.puntaje = puntaje;
		this.numJugadores = numJugadores;
		this.nombreGrupo = nombreGrupo;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.tiempoMinutos = calcularTiempo();
	}
	
	public int calcularTiempo() {
		return calcularTiempo(this.fechaInicio, this.fechaFin);
	}

	public static int calcularTiempo(Date fechaInicio, Date fechaFin) {
		if(fechaInicio==null) {
			fechaInicio = new Date();
		}
	    long tiempoMillis = fechaFin.getTime() - fechaInicio.getTime();
	    int tiempoMinutos = (int) TimeUnit.MILLISECONDS.toMinutes(tiempoMillis);
	    return tiempoMinutos;
	}
	public int calcularTiempoSegundos() {
		return calcularTiempoSegundos(this.fechaInicio, this.fechaFin);
	}
	public static int calcularTiempoSegundos(Date fechaInicio, Date fechaFin) {
		if(fechaInicio==null) {
			fechaInicio = new Date();
		}
	    long tiempoMillis = fechaFin.getTime() - fechaInicio.getTime();
	    int tiempoSegundos = (int) TimeUnit.MILLISECONDS.toSeconds(tiempoMillis);
	    return tiempoSegundos;
	}
	public int getPuntaje() {
		return puntaje;
	}

	public void setPuntaje(int puntos) {
		this.puntaje = puntos;
	}

	public int getNumJugadores() {
		return numJugadores;
	}

	public void setNumJugadores(int numJugadores) {
		this.numJugadores = numJugadores;
	}

	public Sala getSala() {
		return sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}

	public String getNombreGrupo() {
		return nombreGrupo;
	}

	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	
	public int getTiempoMinutos() {
		return tiempoMinutos;
	}

	public void setTiempoMinutos(int tiempoMinutos) {
		this.tiempoMinutos = tiempoMinutos;
	}
	
	public Suscriptor getAnfitrion() {
		return anfitrion;
	}

	public void setAnfitrion(Suscriptor anfitrion) {
		this.anfitrion = anfitrion;
	}

	public int getIdPartida() {
		return idPartida;
	}

	public void setIdPartida(int idPartida) {
		this.idPartida = idPartida;
	}


}
