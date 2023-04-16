package model;

public class Escenario {
	private int idEscenario;
	private String imagen, descripcion;
	private Flecha[] flechas;
	private Objeto[] objetos;
	private Puzzle[] puzzles;
	public Escenario(int idEscenario, String imagen, String descripcion, Flecha[] flechas, Objeto[] objetos,
			Puzzle[] puzzles) {
		super();
		this.idEscenario = idEscenario;
		this.imagen = imagen;
		this.descripcion = descripcion;
		this.flechas = flechas;
		this.objetos = objetos;
		this.puzzles = puzzles;
	}
	public int getIdEscenario() {
		return idEscenario;
	}
	public void setIdEscenario(int idEscenario) {
		this.idEscenario = idEscenario;
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
	public Flecha[] getFlechas() {
		return flechas;
	}
	public void setFlechas(Flecha[] flechas) {
		this.flechas = flechas;
	}
	public Objeto[] getObjetos() {
		return objetos;
	}
	public void setObjetos(Objeto[] objetos) {
		this.objetos = objetos;
	}
	public Puzzle[] getPuzzles() {
		return puzzles;
	}
	public void setPuzzles(Puzzle[] puzzles) {
		this.puzzles = puzzles;
	}
	

}
