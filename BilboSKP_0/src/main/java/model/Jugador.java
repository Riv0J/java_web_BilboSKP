package model;

public class Jugador {
    private String alias;
    private boolean esSuscriptor;

    public Jugador(String alias, boolean esSuscriptor)  {
        this.alias = alias;
        this.esSuscriptor = esSuscriptor;
    }

    public String getAlias() {
        return alias;
    }

    public boolean esSuscriptor() {
    	return this.esSuscriptor;
    }
}
