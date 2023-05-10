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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Dopost perfil");
		HttpSession sesion = request.getSession();
		Object sus = sesion.getAttribute("suscriptor");
		String accion = (String) request.getParameter("accion");
		System.out.println("accion");
		if(!(sus instanceof Suscriptor)) {
			request.getRequestDispatcher("index.jsp?sec=perfil&sub=gestionCuenta").forward(request, response);
			return;
		}
		switch (accion) {
		case "editar":
			if (sus instanceof Suscriptor) {
				String emailViejo = ((Suscriptor) sus).getEmail();
				String nombreNuevo= request.getParameter("nombre");	
				String apellidoNuevo= request.getParameter("apellido");	
				String aliasNuevo= request.getParameter("alias");	
				String emailNuevo= request.getParameter("email");
				String fecha_nacimientoNueva= request.getParameter("fecha_nacimiento");	
				int telefonoNuevo=Integer.parseInt(request.getParameter("telefono"));
				try {
					//usar el metodo de actualizar suscripcion
					boolean sePudoEditar = BilboSKP.actualizarSuscripcion(emailViejo, emailNuevo, aliasNuevo, nombreNuevo, apellidoNuevo,fecha_nacimientoNueva, telefonoNuevo);
					if(sePudoEditar == true) {
						//otro metodo de obtener suscriptor por el email
						Suscriptor susNuevo = BilboSKP.getSuscriptor(emailNuevo);
						//meter al sus en la sesion
						sesion.setAttribute("suscriptor", susNuevo);
					} else {
						System.out.println("ServletPerfil: Error obteniendo email con "+emailViejo);
					}
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}
			break;
		case "baja":
			String checkbox_activo = (String) request.getParameter("checkbox_activo");
			int activo = 0;
			switch (checkbox_activo) {
			case "on":
				activo = 1;
				break;
			case "off":
				try {
					boolean exitoso = BilboSKP.darBajaSuscripcion(((Suscriptor)sus));
					if(exitoso==true) {
						Suscriptor nuevoSus = BilboSKP.getSuscriptor(((Suscriptor)sus).getEmail());
						sesion.setAttribute("suscriptor", nuevoSus);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} catch (Throwable e) {
					e.printStackTrace();
				}
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		request.getRequestDispatcher("index.jsp?sec=perfil&sub=gestionCuenta").forward(request, response);
	}
}
