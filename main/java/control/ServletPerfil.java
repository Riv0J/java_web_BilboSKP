package control;

import java.io.IOException;
import java.sql.Date;
import java.time.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cupon;
import model.Reserva;
import model.Suscriptor;
import view.Mensaje;

@WebServlet("/perfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Doget servlet perfil");
		String subseccion = request.getParameter("sub");

		if (subseccion == null) {
			subseccion = "gestionCuenta";
		}
		System.out.println("la seccion buscada es la subseccion " + subseccion);
		HttpSession sesion = request.getSession();
		Suscriptor sus = (Suscriptor) sesion.getAttribute("suscriptor");

		// Object fecha;
		switch (subseccion) {
		case "gestionCuenta":
			request.getRequestDispatcher("index.jsp?sec=perfil&sub=gestionCuenta").forward(request, response);
			return;

		// RESERVAS
		case "reservas":
			// obtener todas las reservas del suscriptor
			try {
				Vector<Reserva> reservas = BilboSKP.obtenerReserva(12);
				System.out.println("Necesito ayuda 1");
				request.setAttribute("reservas", reservas);
				System.out.println("Necesito ayuda 2");
				request.getRequestDispatcher("index.jsp?sec=perfil?sub=reserva").forward(request, response);
				
				
				//ELIMINAR UNA RESERVA
				if (request.getParameter("borrar") != null) {
					int idReserva = Integer.parseInt(request.getParameter("borrar"));
					BilboSKP.eliminarReserva(idReserva);
					Mensaje m = new Mensaje("Tu reserva ha sido eliminda", Mensaje.MENSAJE_EXITO);
					request.setAttribute("mensaje", m);
				}
			} catch (Throwable e1) {
				System.out.println("Error al mostrar cupones aiuda");
			}
			
			
			
			request.getRequestDispatcher("index.jsp?sec=perfil?sub=reserva");
			break;
			
		// CUPONES
		case "cupones":

			// obtener todos los cupones y guardar
			try {
				Vector<Cupon> cupones = BilboSKP.getCuponesSuscriptor(12);
				System.out.println("Necesito ayuda 1");
				request.setAttribute("cupones", cupones);
				System.out.println("Necesito ayuda 2");
				request.getRequestDispatcher("index.jsp?sec=perfil&sub=cupon").forward(request, response);
			} catch (Throwable e1) {
				System.out.println("Error al mostrar cupones aiuda");
			}

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
