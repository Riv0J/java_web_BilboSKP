package view;

import java.util.HashMap;

public class Icon {
	private static HashMap<String,String> mapaIconClasses = null;
	
	public static void InitIcon() {
		//introducir cada icono con su valor de clase html
		mapaIconClasses = new HashMap<String,String>();
		mapaIconClasses.put("clock", "ri-time-line");
		mapaIconClasses.put("user", "ri-user-line");
		mapaIconClasses.put("user-fill", "ri-user-fill");
		mapaIconClasses.put("lock", "ri-lock-line");
		mapaIconClasses.put("online", "ri-earth-line");
		mapaIconClasses.put("reserva", "ri-file-list-3-line");
		mapaIconClasses.put("fisica", "ri-file-list-3-line");
		mapaIconClasses.put("suspenso", "ri-knife-blood-line");
		mapaIconClasses.put("terror", "ri-skull-line");
		mapaIconClasses.put("misterio", "ri-spy-line");
		mapaIconClasses.put("sci-fi", "ri-aliens-line");
		mapaIconClasses.put("question", "ri-question-mark");
		mapaIconClasses.put("age", "ri-body-scan-fill");
		mapaIconClasses.put("cupon", "ri-coupon-line");
		mapaIconClasses.put("logout", "ri-logout-box-r-line");
		mapaIconClasses.put("copy", "ri-file-copy-2-line");
	}
	public static String getIconHTMLClass(String key) {
		if(mapaIconClasses==null) {
			InitIcon();
		}
		String normalizarLlave = StringHelper.normalizarTexto(key);
		String valor = mapaIconClasses.get(normalizarLlave);
		if (valor == null) {
			valor = mapaIconClasses.get("question");
		}
		return valor;
	}
}
