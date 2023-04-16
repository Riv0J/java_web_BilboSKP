package model;

import java.time.LocalDate;
import java.time.Month;
import java.util.Date;

public class Cupon {
	private int idCupon, idSuscriptor;
	private String estado;
	private Date fechaCaducidad;

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

	public int getIdSuscriptor() {
		return idSuscriptor;
	}

	public void setIdSuscriptor(int idSuscriptor) {
		idSuscriptor = idSuscriptor;
	}
}

