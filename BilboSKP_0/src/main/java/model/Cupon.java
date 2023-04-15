package model;

import java.time.LocalDate;
import java.time.Month;
import java.util.Date;

public class Cupon {
	static int idCupon, idSuscriptor;
	String estado;
	static Date fechaCaducidad;

	public Cupon(int idCupon, String estado,  Date fechaCaducidad) {
		super();
		this.idCupon = idCupon;
		this.estado = estado;
		this.fechaCaducidad = fechaCaducidad;
	}

	public int getId() {
		return idCupon;
	}

	public void setId(String id) {
		this.idCupon = idCupon;
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

	public static int getIdSuscriptor() {
		return idSuscriptor;
	}

	public static void setIdSuscriptor(int idSuscriptor) {
		idSuscriptor = idSuscriptor;
	}
}

