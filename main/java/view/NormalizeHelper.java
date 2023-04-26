package view;

import java.text.Normalizer;

public class NormalizeHelper {

	public static String normalizarTexto(String texto) {
		return Normalizer.normalize(texto, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toLowerCase();
	}
}
