package view;

import java.util.Collection;

import javax.servlet.http.Cookie;

public class CookieHelper {

    private static final String DEFAULT_LENGUAJE = "ES";
    private static final String LENGUAJE_COOKIE_NAME = "BILBOSKP_LENGUAJE";
    
    public static String getLenguajeFromCookies(Collection<Cookie> cookies) {
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
}
