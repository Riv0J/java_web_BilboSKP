package model;

import java.util.Date;

public class Horario {
	private Date fechaHora;
	private boolean disponible;

	public Horario(Date fechaHora, boolean disponible) {
		this.fechaHora = fechaHora;
		this.disponible = disponible;
	}
	
	public Date getFechaHora() {
		return fechaHora;
	}

	public void setFechaHora(Date fechaHora) {
		this.fechaHora = fechaHora;
	}

	public boolean isDisponible() {
		return disponible;
	}

	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
}
