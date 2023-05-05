package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Message;

import model.Suscriptor;
import view.Mensaje;

@WebServlet("/subscribe")
public class ServletSubscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		System.out.println("Dopost subscribe");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String alias = request.getParameter("alias");
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");

		// Obtener el valor del parámetro de entrada de fecha
		String fech_nac = request.getParameter("fech_nac");

		// Parsear la fecha a un objeto java.util.date
		LocalDate fecha = LocalDate.parse(fech_nac);
		//Suscriptor solicitudSuscripcion = new Suscriptor(0,telefono,email,alias,nombre,apellidos,"avatardefault1",0, newDate);
		// Convertir a java.sql.date
		java.sql.Date sqlDate = java.sql.Date.valueOf(fecha);
		boolean exitoso = false;
		try {
			// crea el suscriptor
			Suscriptor sus = BilboSKP.crearSuscripcion(email, pass, telefono, alias, nombre, apellidos, sqlDate);

			if (sus != null) {
				sesion.setAttribute("suscriptor", sus);
				exitoso = true;

			} else {
				Mensaje mensaje = new Mensaje("No se pudo crear suscripcion, inténtalo nuevamente",
						Mensaje.MENSAJE_ERROR);

			}

		} catch (Throwable e) {
			e.printStackTrace();
			System.out.println("Susbscribe: No se pudo crear suscripcion");
			Mensaje mensaje = new Mensaje("No se pudo crear suscripcion, intenta nuevamente", Mensaje.MENSAJE_ERROR);
			request.setAttribute("mensaje", mensaje);

		}
		//redireccionamiento
		// chequear si hay una url previa a hacer la suscripcion
		String urlPrevia = (String) sesion.getAttribute("urlPrevia");
		try {
			if (exitoso == true) {
				if (urlPrevia instanceof String) {
					System.out.println("ServletLogin: habia una url previa: "+urlPrevia);
					response.sendRedirect((String) urlPrevia);
				} else {
					System.out.println("ServletLogin: NO url previa establecida = "+urlPrevia);
					response.sendRedirect("index.jsp");
				}
			} else if (exitoso == false) {
				System.out.println("redireccionando a sec subscribe");
				// si no se pudo hacer la suscripcion, lo manda nuevamente a suscribirse
				request.getRequestDispatcher("index.jsp?sec=subscribe").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error creando suscripcion");
			request.getRequestDispatcher("index.jsp?sec=subscribe").forward(request, response);
		}
	}
}
