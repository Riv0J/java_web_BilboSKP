package model;

public class Objeto {
	public static final int OBJETO_VISIBLE = 1;
	public static final int OBJETO_OCULTO = 0;
	private int idObjeto;
	private String nombre, descripcion, imagen;
	private int visible;
	//porcentajes
	private int coordX, coordY, posicionX, posicionY;
	public Objeto(int idObjeto, String nombre, String descripcion, String imagen, int coordX, int coordY, int posicionX,
			int posicionY, int visible) {
		super();
		setIdObjeto(idObjeto);
		setNombre(nombre);
		setDescripcion(descripcion);
		setImagen(imagen);
		setCoordX(coordX);
		setCoordY(coordY);
		setPosicionX(posicionX);
		setPosicionY(posicionY);
		setVisible(visible);
	}
	public void setVisible(int visible) {
		this.visible = visible;	
	}
	public int getVisible() {
		return visible;
	}
	public int getIdObjeto() {
		return idObjeto;
	}
	public void setIdObjeto(int idObjeto) {
		this.idObjeto = idObjeto;
	}
	public String getNombre() {
		return nombre;
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
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public int getCoordX() {
		return coordX;
	}
	public void setCoordX(int coordX) {
		this.coordX = coordX;
	}
	public int getCoordY() {
		return coordY;
	}
	public void setCoordY(int coordY) {
		this.coordY = coordY;
	}
	public int getPosicionX() {
		return posicionX;
	}
	public void setPosicionX(int posicionX) {
		this.posicionX = posicionX;
	}
	public int getPosicionY() {
		return posicionY;
	}
	public void setPosicionY(int posicionY) {
		this.posicionY = posicionY;
	}
}
