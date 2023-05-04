package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Suscriptor;
import view.Mensaje;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet(urlPatterns = { "/login" }, initParams = { @WebInitParam(name = "contenido", value = "null") })
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletLogin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Dopost login");
		HttpSession sesion = request.getSession();
		// preparar un mensaje
		Mensaje mensaje;
		try {
			// Obtenemos los datos enviados desde el formulario
			String pass = request.getParameter("pass");
			String email = request.getParameter("email");

			// Comprobamos si el usuario y contraseña son válidos
			Suscriptor usuarioLogueado = BilboSKP.loginSuscriptor(email, pass);
			if (usuarioLogueado != null) {
				System.out.println("se pudo logear el usuario");
				HttpSession session = request.getSession();
				// para obtener el suscriptor tendre que escribir sesion.getattribute en el jsp.
				session.setAttribute("suscriptor", usuarioLogueado);
				// introducir un mensaje en el request
				mensaje = new Mensaje("¡Buenas tardes " + usuarioLogueado.getAlias() + "!", Mensaje.MENSAJE_EXITO);
				request.setAttribute("mensaje", mensaje);
			} else {
				System.out.println("Login: no se pudo loguear el usuario");
				// avisar al usuario que sus datos son incorrectos, crear un objeto mensaje.
				mensaje = new Mensaje("Email o contraseña incorrectos", Mensaje.MENSAJE_ERROR);
				request.setAttribute("mensaje", mensaje);
				sesion.setAttribute("mostrarLogin", "si");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			// introducir un mensaje en el request
			mensaje = new Mensaje("Hubo un error procesando tu solicitud, por favor inténtalo más tarde.",
					Mensaje.MENSAJE_ERROR);
			request.setAttribute("mensaje", mensaje);
			sesion.setAttribute("mostrarLogin", "si");
		}
	}
}
