package model;

import java.time.LocalDate;
import java.time.Month;
import java.util.Date;

public class Cupon {
	public static final String CUPON_BIENVENIDA = "Bienvenida";
	public static final String CUPON_REGULAR = "Regular";
	public static final String CUPON_RANKING = "Ranking";
	private int idCupon, idSuscriptor;
	private String estado;
	private Date fechaCaducidad;
	private int Rembolsable;
	
	public Cupon(int idCupon, String estado,  Date fechaCaducidad, int rembolsabilidad) {
		super();
		this.idCupon = idCupon;
		this.estado = estado;
		this.fechaCaducidad = fechaCaducidad;
		this.Rembolsable=rembolsabilidad;
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

	public String getRembolsable() {
    	System.out.println("Entramos en el metodo");
        if (Rembolsable == 0) {
        	
        	System.out.println("Entramos en el if");
        	String Rembolsabilidad="No rembolsable";
        	System.out.println("No es rembolsable");
        	return Rembolsabilidad;
        } else {
        	String Rembolsabilidad=" Rembolsable";

        	System.out.println("Es rembolsable");
        	return Rembolsabilidad;
        }
        }

	public void setRembolsable(int Rembolsable) {
		this.Rembolsable = Rembolsable;
	}
	
	
}

