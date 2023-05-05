package model;

import control.BilboSKP;

//@Rivo
public class Invitado extends Jugador {
	private boolean esSuscriptor;
    public Invitado(String alias, boolean esSuscriptor) {
		super(alias, BilboSKP.generarRutaImagenDefault());
		this.esSuscriptor = esSuscriptor;
	}
}
