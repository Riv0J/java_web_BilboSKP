package model;

import java.util.HashMap;

public class Inventario {
	HashMap<Integer,Objeto> mapaObjetos;

	public Inventario() {
		super();
		mapaObjetos = new HashMap<Integer,Objeto>();
	}
	
	//dado un objeto, intentar usarlo
	public boolean usarObjeto(Objeto objeto){
		if (estaEnInventario(objeto)==true) {
			mapaObjetos.remove(objeto.getIdObjeto(), objeto);
			return true;
		}
		return false;
	}
	
	//agregar un objeto al inventario
	public boolean agregarObjeto(Objeto objeto) {
		if (estaEnInventario(objeto)== false) {
			mapaObjetos.put(objeto.getIdObjeto(), objeto);
			objeto.setVisible(1);
			return true;
		}
		return false;
	}
	
	//comprobar si un objeto ya estaba dentro del inventario
	public boolean estaEnInventario(Objeto objeto) {
		if (mapaObjetos.containsKey(objeto.getIdObjeto())) {
			return true;
		}
		return false;
	}

}
