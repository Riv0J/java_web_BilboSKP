package model;

import java.util.HashMap;

public class SalaOnline extends Sala{
	//este hashmap contendrá todas las salas online disponibles
	private static HashMap<String, SalaOnline> salasOnlineCargadas = new HashMap<String, SalaOnline>();

	public SalaOnline(String idSala, String nombre, String dificultad, String tematica, String descripcion,
			int tiempoMax, int jugadoresMin, int jugadoresMax, int edad_recomendada) {
		super(idSala, nombre, dificultad, tematica, descripcion, tiempoMax, jugadoresMin, jugadoresMax, edad_recomendada);
		// TODO Auto-generated constructor stub
	}

	public static void setSalasCargadas(HashMap<String, SalaOnline> salasCargadas) {
		salasOnlineCargadas = salasCargadas;
	}
	public static HashMap<String, SalaOnline> getSalasCargadas() {
		return salasOnlineCargadas;
	}
	public static SalaOnline getSalaPorId(String idSala) {
		return salasOnlineCargadas.get(idSala);
	}
	public static void clearSalasCargadas() {
		salasOnlineCargadas.clear();
	}
}
