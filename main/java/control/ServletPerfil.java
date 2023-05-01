package control;

import java.io.IOException;
import java.sql.Date;
import java.time.*;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cupon;
import model.Reserva;
import model.Suscriptor;

@WebServlet("/perfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("Doget servlet perfil");
		String subseccion = request.getParameter("subseccion");
		String forward = "";

		if (subseccion == null) {
			subseccion = "editar";
		}
		HttpSession sesion = request.getSession();
		Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor");
		sesion.setAttribute("sus", sus);

		//Object fecha;
		switch (subseccion) {
		case "editar":
			request.getRequestDispatcher("index.jsp?sec=perfil?sub=gestionCuenta").forward(request, response);
			break;
			
		//RESERVAS
		case "reservas":
			// obtener todas las reservas del suscriptor
				Reserva re=(Reserva) sesion.getAttribute("reserava");

			// hacer setAttribute de las reservas
				sesion.setAttribute("re", re);

			// respuesta usuario
				request.getRequestDispatcher("index.jsp?sec=perfil?sub=reserva").forward(request, response);
			break;

			
		//CUPONES
		case "cupones":

			LocalDate fechaCupon = LocalDate.of(2023, 4, 28);
			Date fechaDate = (Date) Date.from(fechaCupon.atStartOfDay(ZoneId.systemDefault()).toInstant());

			Cupon c = new Cupon(1, "Activo", fechaDate);
			ArrayList<Cupon> cupones = new ArrayList<Cupon>();
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);

			// obtener todos los cupones
			// dispatch
			Cupon c1 = (Cupon) sesion.getAttribute("cupon");
			request.getRequestDispatcher("index.jsp?sec=perfil?sub=cupon");
			break;
		default:
		}

		// GUARDAR Y EDITAR DATOS
		if (subseccion.equalsIgnoreCase("editar")) {
			try {

				BilboSKP.actualizarSuscripcion(null);
			} catch (Throwable e) {

				e.printStackTrace();
			}
		}

		// CERRAR SESION
		
		// Enviar la respuesta al usuario
		request.getRequestDispatcher("index.jsp?sec=perfil").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
