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
			sesion.setMaxInactiveInterval(20);
			// Obtener el objeto "Suscriptor" de la sesión
			Object suscriptor = (Object) sesion.getAttribute("suscriptor");

			// si el objeto obtenido es de clases suscriptor, significa que está logeado!
			if (suscriptor instanceof Suscriptor) {
				System.out.println("El objeto Suscriptor existe en la sesión");
				chain.doFilter(request, response);
			} else {
				System.out.println("El objeto Suscriptor existe en la sesión pero no es del tipo suscriptor???");
				// existe la sesion pero no tiene un objeto suscriptor correcto, lo mandamos al
				// login
				/* Suscriptor sus = new Suscriptor(1, 1234, "hola@gmail,com", "pau", "paula", "castillo", "imagen", 1,
						null);
				sesion.setAttribute("suscriptor", sus);
				chain.doFilter(request, response);*/
				request.getRequestDispatcher("index.jsp?sec=incio").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public static void mostrarJSP(ServletResponse response, String rutajsp) {
		try {
			System.out.println(rutajsp);
			// Obtener el PrintWriter para escribir la respuesta
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			PrintWriter out = httpResponse.getWriter();

			// Obtener el contenido del archivo JSP
			String jspContent = new String(Files.readAllBytes(Paths.get(rutajsp)), StandardCharsets.UTF_8);

			// Escribir el contenido del archivo JSP en la respuesta
			out.print(jspContent);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error tratando de devolver jsp");
		}

	}

}
