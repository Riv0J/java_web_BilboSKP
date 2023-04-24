//modelo copiado de FUICA con idea de poner aqui las traducciones y todos los textos que hirian en la web
package model;

import java.util.HashMap;

public class Frases {
	
	private static HashMap<String,String> frases ;
	
	public static void rellenarFrases() {
		frases=new HashMap<String, String>();
		frases.put("ESheaderSalas", "Salas de escape");
		frases.put("ENheaderSalas", "Escape rooms");
		frases.put("ESheaderRanking", "Ranking");
		frases.put("ENheaderRanking", "Ranking");
		frases.put("ESheaderUnirse", "Unirse a partida");
		frases.put("ENheaderUnirse", "Join a game");
		frases.put("ESheaderContacto", "Contacto");
		frases.put("ENheaderContacto", "Contact us");
		frases.put("ESheaderSalas", "Salas de escape");
		frases.put("ENheaderSalas", "Escape rooms");
		frases.put("pruebalupa", "Habéis conseguido resolver la prueba, id al jardín mostrado en el MAPA");
		frases.put("pruebalinterna", "Habéis conseguido resolver la prueba, ahora vamos a unir estos pedazos de papel");
		frases.put("pruebaletras_solucion", "El ultimo ritual sera en la mansion");
		frases.put("pruebaletras_resuelto", "Habéis conseguido descifrar una ubicación  que aparece en el libro \n¿Será la MANSIÓN de Dr.Doofenshmirtz \ndonde podamos resolver este caso?");
		frases.put("pruebacodigo_resuelto", "Conseguís introducir el código correcto    para abrir la caja fuerte; se abre haciendo  un chirrido metálico horrible.\nSorprendidos, descubrís que la caja está   vacía... salvo por una ¡LLAVE dorada!.     La recogéis, con la certeza de que pronto  la necesitaréis");
		
	}
	
	public static String getFrase(String claveFrase) {
		return frases.get(claveFrase);
	}
	
	}

