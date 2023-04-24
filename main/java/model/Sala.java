package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import control.BilboSKP;

public abstract class Sala {
	private static HashMap<String, Sala> todasLasSalasCargadas = new HashMap<String,Sala>();
	private static ArrayList<String> tematicasCargadas = new ArrayList<String>();
	private static ArrayList<String> dificultadesCargadas = new ArrayList<String>();
	int idSala;
	private String nombre, dificultad, tematica, descripcion;

	private int tiempoMax, jugadoresMin, jugadoresMax, edad_recomendada;

	public Sala(int idSala, String nombre, String dificultad, String tematica, String descripcion, int tiempoMax,
			int jugadoresMin, int jugadoresMax, int edad_recomendada) {
		super();
		setIdSala(idSala);
		setNombre(nombre);
		setDificultad(dificultad);
		setTematica(tematica);
		setDescripcion(descripcion);
		setTiempoMax(tiempoMax);
		setJugadoresMin(jugadoresMin);
		setJugadoresMax(jugadoresMax);
		setEdad_recomendada(edad_recomendada);
	}

	public String getTematica() {
		return tematica;
	}

	public void setTematica(String tematica) {
		this.tematica = tematica;
	}

	public String getNombre() {
		return nombre;
	}

	public String getDificultad() {
		return dificultad;
	}

	public void setDificultad(String dificultad) {
		this.dificultad = dificultad;
	}

	public int getTiempoMax() {
		return tiempoMax;
	}

	public void setTiempoMax(int tiempoMax) {
		this.tiempoMax = tiempoMax;
	}

	public int getJugadoresMin() {
		return jugadoresMin;
	}

	public void setJugadoresMin(int jugadoresMin) {
		this.jugadoresMin = jugadoresMin;
	}

	public int getJugadoresMax() {
		return jugadoresMax;
	}

	public void setJugadoresMax(int jugadoresMax) {
		this.jugadoresMax = jugadoresMax;
	}

	public int getEdad_recomendada() {
		return edad_recomendada;
	}

	public void setEdad_recomendada(int edad_recomendada) {
		this.edad_recomendada = edad_recomendada;
	}

	public void setIdSala(int idSala) {
		this.idSala = idSala;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getIdSala() {
		return this.idSala;
	}

	public static HashMap<String, Sala> getTodasLasSalasCargadas() {
		if(todasLasSalasCargadas.size()>0) { 
			return todasLasSalasCargadas;
		}
		HashMap<String, Sala> mapaSalasCargadas = new HashMap<String, Sala>();
		// obtener las salas cargadas de cada tipo
		HashMap<Integer, SalaOnline> salasOnline = SalaOnline.getSalasCargadas();
		HashMap<Integer, SalaFisica> salasFisicas = SalaFisica.getSalasCargadas();
		
		for (Map.Entry<Integer, SalaOnline> par : salasOnline.entrySet()) {
			mapaSalasCargadas.put("SO" + par.getKey(), par.getValue());
		}
		// agregar las salas fisicas cargadas
		for (Map.Entry<Integer, SalaFisica> par : salasFisicas.entrySet()) {
			mapaSalasCargadas.put("SF" + par.getKey(), par.getValue());
		}
		setTodasLasSalasCargadas(mapaSalasCargadas);
		return mapaSalasCargadas;
	}
	public static void setTodasLasSalasCargadas(HashMap<String, Sala> todasLasSalasCargadas) {
		Sala.todasLasSalasCargadas = todasLasSalasCargadas;
	}
	public static void setTematicasCargadas(ArrayList<String> tematicasCargadas) {
		Sala.tematicasCargadas = tematicasCargadas;
	}
	
	public static ArrayList<String> getTematicasCargadas() {
		return tematicasCargadas;
	}

	public static void setDificultadesCargadas(ArrayList<String> dificultadesCargadas) {
		Sala.dificultadesCargadas = dificultadesCargadas;
	}

	public static ArrayList<String> getDificultadesCargadas() {
		return dificultadesCargadas;
	}
	
	public static Sala getSalaPorId(String idSala) {
		return todasLasSalasCargadas.get(idSala);
	}
}
