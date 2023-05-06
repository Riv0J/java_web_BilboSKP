package model;

import javax.servlet.http.HttpSession;

public class Jugador{
    private String alias;
    private String imagen;
    
    public Jugador(String alias, String imagen)  {
        this.setAlias(alias);
        this.setImagen(imagen);
    }
    public Jugador() {
    	
    }
    public String getAlias() {
        return alias;
    }
    public String getImagen() {
    	return imagen;
    }
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
}
