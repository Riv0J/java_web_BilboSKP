package model;

public class Pista {
	private int idPista, penalizacion; 
	private String descripcion;
	public Pista(int idPista, String descripcion, int penalizacion) {
		super();
		setIdPista(idPista);
		setDescripcion(descripcion);
		setPenalizacion(penalizacion);
	}
	public int getIdPista() {
		return idPista;
	}
	public void setIdPista(int idPista) {
		this.idPista = idPista;
	}
	public int getPenalizacion() {
		return penalizacion;
	}
	public void setPenalizacion(int penalizacion) {
		this.penalizacion = penalizacion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
