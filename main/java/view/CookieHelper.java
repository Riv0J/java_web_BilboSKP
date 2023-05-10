package view;

import java.util.ArrayList;

import javax.servlet.http.Cookie;

public class CookieHelper {
	public static final ArrayList<String> LENGUAJES_DISPONIBLES = null;
    public static final String DEFAULT_LENGUAJE = "EN";
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
    	if(LENGUAJES_DISPONIBLES.contains(lenguaje)) {
    		return true;
    	}
    	return false;
    }
}
