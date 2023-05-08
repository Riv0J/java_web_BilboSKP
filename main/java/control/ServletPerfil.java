package control;

import java.io.IOException;
import java.sql.Date;
import java.time.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
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

@WebServlet({"/perfil","/perfil/*"})
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

		switch (subseccion) {
		//GUARDAR DATOS MODIFICADOS EN LA BD
		case "gestionCuenta":
			try {				
				BilboSKP.actualizarSuscripcion(sus);
				request.getRequestDispatcher("index.jsp?sec=perfil&sub=gestionCuenta").forward(request, response);
				
			} catch (Throwable e1) {
				
			}
			
		
		//Darse de baja	
			
			
			
			
			break;

		// RESERVAS
		case "reserva":
			// obtener todas las reservas del suscriptor
			try {
				Vector<Reserva> reservas = BilboSKP.obtenerReserva(sus.getIdSuscriptor());
				request.setAttribute("reservas", reservas);
				if(reservas==null) {
					System.out.println("UPSI PUES VA A SER ESTO");
				}
				request.getRequestDispatcher("index.jsp?sec=perfil&sub=reserva").forward(request, response);				
				
				
			} catch (Throwable e1) {
				System.out.println("No tienes ninguna reserva :(");
			}
			break;
			
		// CUPONES
		case "cupones":

			System.out.println("Llegamos a la subsesccion");
			// obtener todos los cupones y guardar
			try {
				System.out.println("Entramos en try");
				Vector<Cupon> cupones = BilboSKP.getCuponesSuscriptor(sus.getIdSuscriptor());
				request.setAttribute("cupones", cupones);
				if(cupones==null) {
					System.out.println("UPSI PUES VA A SER ESTO");
				}
				request.getRequestDispatcher("index.jsp?sec=perfil&sub=cupones").forward(request, response);
			} catch (Throwable e1) {
			}
			break;
		default:
		}

		
		/*//ELIMINAR UNA RESERVA
		if (request.getParameter("borrar") != null) {
			int idReserva = Integer.parseInt(request.getParameter("borrar"));
			BilboSKP.eliminarReserva(idReserva);
			Mensaje m = new Mensaje("Tu reserva ha sido eliminda", Mensaje.MENSAJE_EXITO);
			request.setAttribute("mensaje", m);
		}*/

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		HttpSession sesion = request.getSession();
		Suscriptor sus = (Suscriptor) sesion.getAttribute("suscriptor");

		
		System.out.println("Dopost perfil");		
		String nombreNuevo= request.getParameter("nombre");	
		System.out.println("El nombre nuevo es " + nombreNuevo);
		
		String apellidoNuevo= request.getParameter("apellido");	
		System.out.println("El apellido nuevo es " + apellidoNuevo);
		
		String aliasNuevo= request.getParameter("alias");	
		System.out.println("El alias nuevo es " + aliasNuevo);
		
		String emailNuevo= request.getParameter("email");	
		System.out.println("El email nuevo es " + emailNuevo);
		
		String fecha_nacimientoNueva= request.getParameter("fecha_nacimiento");	
		System.out.println("La fecha de nacimiento nueva es " + fecha_nacimientoNueva);
		
		String telefonoNuevo= request.getParameter("telefono");	
		System.out.println("El telefono nuevo es " + telefonoNuevo);
		
		try {
			BilboSKP.actualizarSuscripcion(sus);
			System.out.println(sus.getNombre());
		} catch (Throwable e) {
			
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher("index.jsp?sec=perfil&sub=gestionCuenta").forward(request, response);
		
		
	}

}
