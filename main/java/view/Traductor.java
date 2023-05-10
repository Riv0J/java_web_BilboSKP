//modelo copiado de FUICA con idea de poner aqui las traducciones y todos los textos que hirian en la web
package view;

import java.util.HashMap;

public class Traductor {

	private static HashMap<String, String> mapaTraducciones = null;
	//estructura de los datos = ("lenguaje-id", "texto");

	public static void initFrases() {
		mapaTraducciones=new HashMap<String, String>();
		/*castellano*/
		/*HEADER*/
		mapaTraducciones.put("ES-inicio1", "Experimenta nuestras salas de escape");
		mapaTraducciones.put("EN-inicio1", "Experience our scape rooms");
		mapaTraducciones.put("EN-headerSalas", "Escape rooms");
		mapaTraducciones.put("ES-headerRanking", "Ranking");
		mapaTraducciones.put("EN-headerRanking", "Ranking");
		mapaTraducciones.put("ES-headerUnirse", "Unirse a partida");
		mapaTraducciones.put("EN-headerUnirse", "Join a game");
		mapaTraducciones.put("ES-headerContacto", "Contacto");
		mapaTraducciones.put("EN-headerContacto", "Contact us");
		
		/* INICIO */
	
		/*SALAS ES*/
		mapaTraducciones.put("ES-online", "Online");
		mapaTraducciones.put("ES-reserva", "Reserva");

		mapaTraducciones.put("ES-modalidad", "Modalidad");
		mapaTraducciones.put("ES-tematica", "Temática");
		mapaTraducciones.put("ES-dificultad", "Dificultad");
		
		mapaTraducciones.put("ES-terror", "Terror");
		mapaTraducciones.put("ES-suspenso", "Suspenso");
		mapaTraducciones.put("ES-misterio", "Misterio");
		mapaTraducciones.put("ES-sci-fi", "Sci-Fi");
		
		mapaTraducciones.put("ES-facil", "Fácil");
		mapaTraducciones.put("ES-media", "Media");
		mapaTraducciones.put("ES-dificil", "Dificil");
		
		mapaTraducciones.put("ES-salas1", "Buscar salas de escape por nombre");
		mapaTraducciones.put("ES-salas2", "Todas las modalidades");
		mapaTraducciones.put("ES-salas3", "Online");
		mapaTraducciones.put("ES-salas4", "Físicas");
		mapaTraducciones.put("ES-salas5", "Todas las temáticas");
		mapaTraducciones.put("ES-salas6", "Todas las dificultades");
		mapaTraducciones.put("ES-salas7", "Mostrando");
		mapaTraducciones.put("ES-salas8", "Resultados");
		mapaTraducciones.put("ES-salas9", "No se encontraron salas");
		mapaTraducciones.put("ES-salas10", "Ver todas las salas");
		mapaTraducciones.put("ES-salas11", "Ver sala");
		mapaTraducciones.put("ES-salas12", "");
		
		/* SALAS EN*/
	}

	public static String get(String lenguaje, String claveFrase) {
		if(mapaTraducciones==null) {
			initFrases();
		}
		String frase = mapaTraducciones.get(lenguaje+"-"+claveFrase);
		if (frase==null) {
			System.out.println("Traductor: No he podido encontrar '"+lenguaje+"-"+claveFrase+"' en el hashmap.");
		}
		return frase;
	}

}
