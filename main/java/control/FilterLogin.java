package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

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
import view.Mensaje;

//
@WebFilter({ "/perfil", "/perfil/*", "/organizar", "/reservar" })
public class FilterLogin implements Filter {

	public FilterLogin() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			System.out.println("Petición filtrada en FilterLogin");
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession sesion = (req.getSession());
			// establecer el tiempo de vida de la sesion en 2 min
			sesion.setMaxInactiveInterval(20000);
			// Obtener el objeto "Suscriptor" de la sesión
			Object suscriptor = (Object) sesion.getAttribute("suscriptor");

			// si el objeto obtenido es de clases suscriptor, significa que está logeado!
			if (suscriptor instanceof Suscriptor) {
				//dejar pasar
				System.out.println("El objeto Suscriptor existe en la sesión");
				chain.doFilter(request, response);
			} else {
				//redireccionar
				Mensaje mensaje = new Mensaje("¡Por favor inicia sesión antes de continuar!.",
						Mensaje.MENSAJE_ERROR);
				request.setAttribute("mensaje", mensaje);
				System.out.println("El objeto Suscriptor no existe en la sesión");
				try {
					sesion.setAttribute("mostrarLogin", "si");
					String urlPrevia = (String) sesion.getAttribute("urlPrevia");
					if (urlPrevia instanceof String) {
						System.out.println("ServletOrganizar: habia una url previa: "+urlPrevia);
						((HttpServletResponse) response).sendRedirect((String) urlPrevia);
					} else {
						System.out.println("ServletOrganizar: NO url previa establecida = "+urlPrevia);
						((HttpServletResponse) response).sendRedirect("index.jsp");
					}
				} catch (Exception e) {
					e.printStackTrace();
					((HttpServletResponse) response).sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
}
