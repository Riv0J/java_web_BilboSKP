package model;

public class Flecha{
	private int idEscenarioDestino;
	private Integer idObjetoQueDesbloqueaFlecha;
	private String imagen, mensajeError;
	//porcentaje
	private int coordX, coordY, posicionX, posicionY;
	
	public Flecha(int idEscenarioDestino, Integer idObjetoQueDesbloqueaFlecha, String imagen, String mensajeError,
			int coordX, int coordY, int posicionX, int posicionY) {
		super();
		setIdEscenarioDestino(idEscenarioDestino);
		setIdObjetoQueDesbloqueaFlecha(idObjetoQueDesbloqueaFlecha);
		setImagen(imagen);
		setMensajeError(mensajeError);
		setCoordX(coordX);
		setCoordY(coordY);
		setPosicionX(posicionX);
		setPosicionY(posicionY);
	}
	public int getIdEscenarioDestino() {
		return idEscenarioDestino;
	}
	public void setIdEscenarioDestino(int idEscenarioDestino) {
		this.idEscenarioDestino = idEscenarioDestino;
	}
	public Integer getIdObjetoQueDesbloqueaFlecha() {
		return idObjetoQueDesbloqueaFlecha;
	}
	public void setIdObjetoQueDesbloqueaFlecha(Integer idObjetoQueDesbloqueaFlecha) {
		this.idObjetoQueDesbloqueaFlecha = idObjetoQueDesbloqueaFlecha;
	}
	public String getMensajeError() {
		return mensajeError;
	}
	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
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
