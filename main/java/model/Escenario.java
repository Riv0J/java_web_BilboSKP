package model;

import java.util.Vector;

public class Escenario {
	private String nombreEscenario, imagen, descripcion;
	private int jsp;
	private Vector<Flecha> flechas;
	private Vector<Objeto> objetos;
	private Vector<Puzzle> puzzles;
	public Escenario(String nombreEscenario, String imagen, String descripcion, Vector<Flecha> vectorFlechas, Vector<Objeto> vectorObjetos,
			Vector<Puzzle> vectorPuzzle, int jsp) {
		setNombreEscenario(nombreEscenario);
		setImagen(imagen);
		setDescripcion(descripcion);
		setFlechas(vectorFlechas);
		setObjetos(vectorObjetos);
		setPuzzles(vectorPuzzle);
		setJsp(jsp);
	}
	//constructor alternativo
	public Escenario(String nombreEscenario, String imagen, String descripcion) {
		setNombreEscenario(nombreEscenario);
		setImagen(imagen);
		setDescripcion(descripcion);
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Vector<Flecha> getFlechas() {
		if( flechas==null || flechas.size() == 0  ) {
			System.out.println("Flechas es null");
		} else {
			for (Flecha flecha : flechas) {
				System.out.println("ENCONTRADO FLECHA HACIA "+flecha.getIdEscenarioDestino());
			}
		}
		
		return flechas;
	}
	public void setFlechas(Vector<Flecha> vectorFlechas) {
		this.flechas = vectorFlechas;
	}
	public Vector<Objeto> getObjetos() {
		return objetos;
	}
	public void setObjetos(Vector<Objeto> vectorObjetos) {
		this.objetos = vectorObjetos;
	}
	public Vector<Puzzle> getPuzzles() {
		return puzzles;
	}
	public void setPuzzles(Vector<Puzzle> vectorPuzzle) {
		this.puzzles = vectorPuzzle;
	}
	public String getNombreEscenario() {
		return nombreEscenario;
	}
	public void setNombreEscenario(String nombreEscenario) {
		this.nombreEscenario = nombreEscenario;
	}
	public int getJsp() {
		return jsp;
	}
	public void setJsp(int jsp) {
		this.jsp = jsp;
	}
}
