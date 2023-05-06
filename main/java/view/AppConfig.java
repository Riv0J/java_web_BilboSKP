package view;

import java.awt.Color;
import java.util.HashMap;

public class AppConfig {
	//ESTA CLASE NO SE UTILIZA
	private static HashMap<String,String> mapaConfig = null;
	
	public static HashMap<String, String> getMapaConfig() {
		if(mapaConfig==null) {
			mapaConfig = new HashMap<String,String>();
			mapaConfig.put("colorAcento", "#29fd53");
			mapaConfig.put("colorMuyOscuro", "#131313");
			mapaConfig.put("colorOscuro", "#353535");
			mapaConfig.put("colorMenosOscuro", "#303136");
			mapaConfig.put("colorMuyClaro", "#FFFFFF");
			mapaConfig.put("colorClaro", "#646464");
		}
		return mapaConfig;
	}

	public static void setMapaConfig(HashMap<String, String> mapaConfig) {
		AppConfig.mapaConfig = mapaConfig;
	}
	
	/* #ColorPrincipal {
	color: #29fd53; verde
	color: #353535; muy gris
	color: #303136; gris */

}
