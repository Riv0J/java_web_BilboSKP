package model;

//@Rivo
public class Invitado extends Jugador {
	private boolean esSuscriptor;
    public Invitado(String alias, boolean esSuscriptor) {
		super(alias);
		this.esSuscriptor = esSuscriptor;
	}
}
