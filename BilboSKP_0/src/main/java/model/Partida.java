package model;

import java.util.Date;

public class Partida {
	private Suscriptor anfitrion;
	private Sala sala;
	private int idPartida, puntaje, numJugadores;
	private String nombreGrupo;
	Date fechaInicio, fechaFin;

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
	}

	public int getPuntos() {
		return puntaje;
	}

	public void setPuntos(int puntos) {
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

}
