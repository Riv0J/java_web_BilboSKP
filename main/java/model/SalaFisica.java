package model;

import java.util.HashMap;

import control.BilboSKP;

public class SalaFisica extends Sala{
	private String direccion;
	private int telefono;
	//este hashmap contendra todas las salas fisicas disponibles
	private static HashMap<Integer, SalaFisica> salasFisicasCargadas = new HashMap<Integer, SalaFisica>();
	
	public SalaFisica(int idSala, String nombre, String dificultad, String tematica, String descripcion,
			int tiempoMax, int jugadoresMin, int jugadoresMax, int edad_recomendada, String direccion, int telefono) {
		super(idSala, nombre, dificultad, tematica, descripcion, tiempoMax, jugadoresMin, jugadoresMax,
				edad_recomendada);
		this.direccion = direccion;
		this.telefono = telefono;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public static void setSalasCargadas(HashMap<Integer, SalaFisica> salasPorCargar) {
		salasFisicasCargadas = salasPorCargar;
	}
	public static HashMap<Integer, SalaFisica> getSalasCargadas() {
		//si no hay salas fisica cargadas, trata de consultarlas de nuevo y establecerlas
		if (salasFisicasCargadas.size()==0) {
			try {
				BilboSKP.cargarSalasFisicas();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return salasFisicasCargadas;
	}
	public static void clearSalasCargadas() {
		salasFisicasCargadas.clear();
	}
	public static SalaFisica datosSalaFisica(String idSala) {
		SalaFisica salafisica = (SalaFisica) salasFisicasCargadas.get(idSala);
		return salafisica;
	}
}
