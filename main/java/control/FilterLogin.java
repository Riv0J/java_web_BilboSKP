package control;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Suscriptor;
//
@WebFilter({"/perfil3/","/perfil3/*","/organizar3","/reservar3"})
public class FilterLogin implements Filter {

	public FilterLogin() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Petición filtrada en FilterLogin");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession sesion = (req.getSession(false));
		if (sesion != null) {
			// Obtener el objeto "Suscriptor" de la sesión
			Suscriptor suscriptor = (Suscriptor) sesion.getAttribute("suscriptor");
			if (suscriptor != null) {
				System.out.println("El objeto Suscriptor existe en la sesión");
				chain.doFilter(request, response);
			} else {
				//existe la sesion pero no tiene un objeto suscriptor, lo mandamos al login
				request.getRequestDispatcher("index.jsp?sec=preguntarLogin").forward(request, response);
			}
			
		} else {
			// no existe la sesion, lo mandamos al login
			request.getRequestDispatcher("index.jsp?sec=preguntarLogin").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
