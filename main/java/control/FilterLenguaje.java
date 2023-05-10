package control;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import view.CookieHelper;
import view.Traductor;

@WebFilter("/*")
public class FilterLenguaje implements Filter {

    public FilterLenguaje() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    
	    // Verificar si la cookie existe
	    boolean found = false;
	    Cookie[] cookies = req.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals(CookieHelper.LENGUAJE_COOKIE_NAME)) {
	                found = true;
	                break;
	            }
	        }
	    }
	    // Si la cookie no existe, agregarla con valor predeterminado
	    if (!found) {
	        Cookie cookie = new Cookie(CookieHelper.LENGUAJE_COOKIE_NAME, CookieHelper.DEFAULT_LENGUAJE);
	        cookie.setMaxAge(3600 * 24 * 365);
	        cookie.setPath("/");
	        res.addCookie(cookie);
	    }
	    
	    chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
