package model;

public class Flecha{
	private String nombreEscenarioDestino;
	private Integer idObjetoQueDesbloqueaFlecha;
	private String imagen, mensajeError;
	//porcentaje
	private int dimensionX, dimensionY, posicionX, posicionY;
	
	public Flecha(String nombreEscenarioDestino, Integer idObjetoQueDesbloqueaFlecha, String imagen, String mensajeError,
			int dimensionX, int dimensionY, int posicionX, int posicionY) {
		setIdEscenarioDestino(nombreEscenarioDestino);
		setIdObjetoQueDesbloqueaFlecha(idObjetoQueDesbloqueaFlecha);
		setImagen(imagen);
		setMensajeError(mensajeError);
		setdimensionX(dimensionX);
		setdimensionY(dimensionY);
		setPosicionX(posicionX);
		setPosicionY(posicionY);
	}
	public Flecha(String nombreEscenarioDestino, String imagen, int dimensionX, int dimensionY, int posicionX, int posicionY) {
		setIdEscenarioDestino(nombreEscenarioDestino);
		setImagen(imagen);
		setdimensionX(dimensionX);
		setdimensionY(dimensionY);
		setPosicionX(posicionX);
		setPosicionY(posicionY);
	}
	public String getIdEscenarioDestino() {
		return nombreEscenarioDestino;
	}
	public void setIdEscenarioDestino(String idEscenarioDestino) {
		this.nombreEscenarioDestino = idEscenarioDestino;
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
	public int getdimensionX() {
		return dimensionX;
	}
	public void setdimensionX(int dimensionX) {
		this.dimensionX = dimensionX;
	}
	public int getdimensionY() {
		return dimensionY;
	}
	public void setdimensionY(int dimensionY) {
		this.dimensionY = dimensionY;
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
