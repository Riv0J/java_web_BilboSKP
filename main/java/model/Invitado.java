package model;

import javax.servlet.http.HttpSession;

import control.BilboSKP;

//@Rivo
public class Invitado extends Jugador {
	private Suscriptor suscriptor = null;
	//crear un invitado sin sus
    public Invitado() {
		super(NombresAleatorios.getNombreAleatorio(), BilboSKP.generarRutaImagenDefault());
	}
    //crear un invitado dado un sus
    public Invitado(Suscriptor sus) {
    	this.setSuscriptor(sus);
    	setAlias(sus.getAlias());
    	setImagen(sus.getImagen());
    }
	public Suscriptor getSuscriptor() {
		return suscriptor;
	}
	public void setSuscriptor(Suscriptor suscriptor) {
		this.suscriptor = suscriptor;
	}
}
