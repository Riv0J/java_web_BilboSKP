package view;

import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

public class StringHelper {

	public static String normalizarTexto(String texto) {
		return Normalizer.normalize(texto, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toLowerCase();
	}
	public static String getDiaSemana(Date fecha) {
		return new SimpleDateFormat("EEEE", Locale.getDefault()).format(fecha);
	}
	public static String getFechaDDMMAA(Date fecha) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        return formatter.format(fecha);
	}
	public static String getLocalDateString(LocalDate localDate) {
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		return localDate.format(formato);
	}
}
