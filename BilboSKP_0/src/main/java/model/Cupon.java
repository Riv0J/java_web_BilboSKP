package model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;

public class Cupon {
	static String id, estado, idSuscriptor;
	static Date fechaCaducidad;

	public Cupon(String id, String estado,  Date fechaCaducidad) {
		super();
		this.id = id;
		this.estado = estado;
		this.fechaCaducidad = fechaCaducidad;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFechaCaducidad() {
		return fechaCaducidad;
	}

	public void setFechaCaducidad(Date fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}



	public static String getIdJugador() {
		return idSuscriptor;
	}

	public static void setIdJugador(String idJugador) {
		idSuscriptor = idJugador;
	}
}

