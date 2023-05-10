package view;

import java.util.ArrayList;

import javax.servlet.http.Cookie;

public class CookieHelper {
	private static ArrayList<String> LENGUAJES_DISPONIBLES = null;
	public static final String DEFAULT_LENGUAJE = "ES";
    public static final String LENGUAJE_COOKIE_NAME = "BILBOSKP_LENGUAJE";
    
    public static String getLenguajeFromCookies(Cookie[] cookies) {
        String lenguaje = DEFAULT_LENGUAJE;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(LENGUAJE_COOKIE_NAME)) {
                    lenguaje = cookie.getValue();
                    break;
                }
            }
        }
        return lenguaje;
    }
    public static boolean lenguajeDisponible(String lenguaje) {
    	if(getLenguajesDisponibles().contains(lenguaje)) {
    		return true;
    	}
    	return false;
    }
    public static ArrayList<String> getLenguajesDisponibles() {
    	if(LENGUAJES_DISPONIBLES == null) {
    		initLenguajesDisponibles();
    	}
		return LENGUAJES_DISPONIBLES;
	}
	private static void initLenguajesDisponibles() {
		LENGUAJES_DISPONIBLES = new ArrayList<String>();
		LENGUAJES_DISPONIBLES.add("ES");
		LENGUAJES_DISPONIBLES.add("EN");
	}
}
