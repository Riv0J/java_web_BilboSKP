package model;

public class Puzzle {
	private int idPuzzle, puntaje;
	private String descripcion;
	private Pista[] arrayPistas;
	
	public Puzzle(int idPuzzle, int puntaje, String descripcion, Pista[] arrayPistas) {
		super();
		setIdPuzzle(idPuzzle);
		setPuntaje(puntaje);
		setDescripcion(descripcion);
		setArrayPistas(arrayPistas);
	}
	
	public Pista[] getArrayPistas() {
		return arrayPistas;
	}
	public void setArrayPistas(Pista[] arrayPistas) {
		this.arrayPistas = arrayPistas;
	}
	public int getIdPuzzle() {
		return idPuzzle;
	}
	public void setIdPuzzle(int idPuzzle) {
		this.idPuzzle = idPuzzle;
	}
	public int getPuntaje() {
		return puntaje;
	}
	public void setPuntaje(int puntaje) {
		this.puntaje = puntaje;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
