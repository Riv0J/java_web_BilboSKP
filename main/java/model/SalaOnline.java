package model;

import java.util.HashMap;

import control.BilboSKP;

public class SalaOnline extends Sala{
	//este hashmap contendrá todas las salas online disponibles
	private static HashMap<Integer, SalaOnline> salasOnlineCargadas = new HashMap<Integer, SalaOnline>();

	public SalaOnline(int idSala, String nombre, String dificultad, String tematica, String descripcion,
			int tiempoMax, int jugadoresMin, int jugadoresMax, int edad_recomendada) {
		super(idSala, nombre, dificultad, tematica, descripcion, tiempoMax, jugadoresMin, jugadoresMax, edad_recomendada);
	}
	public SalaOnline(int idSala, String nombre, String dificultad, String tematica, String descripcion) {
		super(idSala,nombre,dificultad,tematica,descripcion);
	}
	public static void setSalasCargadas(HashMap<Integer, SalaOnline> salasPorCargar) {
		salasOnlineCargadas = salasPorCargar;
	}
	public static HashMap<Integer, SalaOnline> getSalasCargadas() {
		//si no hay salas online cargadas, trata de consultarlas de nuevo y establecerlas
		if (salasOnlineCargadas.size()==0) {
			try {
				BilboSKP.cargarSalasOnline();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return salasOnlineCargadas;
	}
	public static SalaOnline getSalaPorId(int idSalaOnline) {
		return salasOnlineCargadas.get(idSalaOnline);
	}
	public static void clearSalasCargadas() {
		salasOnlineCargadas.clear();
	}
}
