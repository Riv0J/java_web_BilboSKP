package model;

public class Jugador {
    private String alias;
    private String imagen;
    public Jugador(String alias, String imagen)  {
        this.alias = alias;
        this.imagen = imagen;
    }
    public String getAlias() {
        return alias;
    }
    public String getImagen() {
    	return imagen;
    }
}
