//modelo copiado de FUICA con idea de poner aqui las traducciones y todos los textos que hirian en la web
package view;

import java.util.HashMap;

public class Traductor {

	private static HashMap<String, String> mapaTraducciones = null;
	//estructura de los datos = ("lenguaje-id", "texto");

	public static void initFrases() {
		mapaTraducciones=new HashMap<String, String>();
		/*HEADER*/
		mapaTraducciones.put("ES-headerSalas", "Salas de escape");
		mapaTraducciones.put("EN-headerSalas", "Escape rooms");
		mapaTraducciones.put("ES-headerRanking", "Ranking");
		mapaTraducciones.put("EN-headerRanking", "Ranking");
		mapaTraducciones.put("ES-headerUnirse", "Unirse a partida");
		mapaTraducciones.put("EN-headerUnirse", "Join a game");
		mapaTraducciones.put("ES-headerContacto", "Contacto");
		mapaTraducciones.put("EN-headerContacto", "Contact us");
		
		/* INICIO */
		
		
		/*FAQ+Contacto*/
		mapaTraducciones.put("ES-Contactocontacto", "Contacto");
		mapaTraducciones.put("EN-Contactocontacto", "Contact");
		mapaTraducciones.put("ES-ContactoDireccion", "Dirección");
		mapaTraducciones.put("EN-ContactoDireccion", "Address");
		mapaTraducciones.put("ES-ContactoBotonCerrar", "Cerrar mapa");
		mapaTraducciones.put("EN-ContactoBotonCerrar", "Close map");
		mapaTraducciones.put("ES-ContactoTelefono", "Telefono");
		mapaTraducciones.put("EN-ContactoTelefono", "Phone number");
		mapaTraducciones.put("ES-ContactoRedes", "Redes Sociales");
		mapaTraducciones.put("EN-ContactoRedes", "Social Media");
		mapaTraducciones.put("ES-ContactoFAQ", "Preguntas frecuentes");
		mapaTraducciones.put("EN-ContactoFAQ", "FAQ");
		mapaTraducciones.put("ES-ContactoMetro", "¿Las paradas de Metro mas cercanas? ");
		mapaTraducciones.put("EN-ContactoMetro", "The nearest subway stations?");
		mapaTraducciones.put("ES-ContactoOtraConsulta", "¿Tienes alguna otra consulta que hacernos?");
		mapaTraducciones.put("EN-ContactoOtraConsulta", "Do you have any other question to ask us?");
		mapaTraducciones.put("ES-ContactoTextarea", "Escribe aqui tu pregunta");
		mapaTraducciones.put("EN-ContactoTextarea", "Write your question here");
		mapaTraducciones.put("ES-ContactoEnviar", "Enviar");
		mapaTraducciones.put("EN-ContactoEnviar", "Send");
		mapaTraducciones.put("ES-ContactoBorrar", "Borrar");
		mapaTraducciones.put("EN-ContactoBorrar", "Erase");
		/*SALAS*/
		mapaTraducciones.put("ES-SalasBuscar", "Buscar salas de escape por nombre");
		mapaTraducciones.put("EN-SalasBuscar", "Search escape rooms by name");
		mapaTraducciones.put("ES-SalasModalidades", "Todas las modalidades");
		mapaTraducciones.put("EN-SalasModalidades", "All the modes");
		mapaTraducciones.put("ES-SalasOnline", "Salas Online");
		mapaTraducciones.put("EN-SalasOnline", "Online Rooms");
		mapaTraducciones.put("ES-SalasFisicas", "Salas Fisicas");
		
	}

	public static String getFrase(String claveFrase) {
		if(mapaTraducciones==null) {
			initFrases();
		}
		return mapaTraducciones.get(claveFrase);
	}

}
