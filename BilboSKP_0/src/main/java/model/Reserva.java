package model;

import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

import control.BilboSKP;

public class Reserva {
	//atributos 
	private int idReserva, idSalaFisica;
	private int idSuscriptor;
	private int numJugadores;
	private Date fechaHora;
	private int estado; // si es cero cancelada y si es uno confirmada
	public Reserva(int idReserva, int idSalaFisica, int idSuscriptor, int numJugadores, Date fechaHora, int estado) {
		super();
		this.idReserva = idReserva;
		this.idSalaFisica = idSalaFisica;
		this.idSuscriptor = idSuscriptor;
		this.numJugadores = numJugadores;
		this.fechaHora = fechaHora;
		this.estado = estado;
	}
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public int getIdSalaFisica() {
		return idSalaFisica;
	}
	public void setIdSalaFisica(int idSalaFisica) {
		this.idSalaFisica = idSalaFisica;
	}
	public int getIdSuscriptor() {
		return idSuscriptor;
	}
	public void setIdSuscriptor(int idSuscriptor) {
		this.idSuscriptor = idSuscriptor;
	}
	public int getNumJugadores() {
		return numJugadores;
	}
	public void setNumJugadores(int numJugadores) {
		this.numJugadores = numJugadores;
	}
	public Date getFechaHora() {
		return fechaHora;
	}
	public void setFechaHora(Date fechaHora) {
		this.fechaHora = fechaHora;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
}
