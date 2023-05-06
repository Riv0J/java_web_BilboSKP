package model;

import javax.servlet.http.HttpSession;

import control.BilboSKP;

public class Anfitrion extends Jugador{
	//crear un anfitrion dado un sus
	public Anfitrion(Suscriptor sus) {
		super(sus.getAlias(), sus.getImagen());
	}
	//constructor alternativo
    public Anfitrion() {
		super(NombresAleatorios.getNombreAleatorio(), BilboSKP.generarRutaImagenDefault());
	}
	//iniciar partida
	//Solicitar pista
	//cancelar Partida
}
