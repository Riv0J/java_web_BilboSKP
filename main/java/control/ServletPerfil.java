package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Reserva;
import model.Suscriptor;

@WebServlet("/indexPerfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String INSERT_OR_EDIT="gestionCuenta.jsp ";
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
	String subseccion =	request.getParameter("subseccion");
	String forward="";
	
	if(subseccion==null) {
		subseccion="editar";
	}
	//Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor"); 
	//sesion.setAttribute("sus", sus);
	
		HttpSession sesion = request.getSession();
		switch (subseccion) {
		case"editar":
			request.getRequestDispatcher("index.jsp?sec=indexPerfil?sub=gestionCuenta").forward(request, response);
			break;
		case "reservas":
			//obtener todas las reservas del suscriptor
			
			ArrayList <Reserva> reserva=new ArrayList<Reserva>();
			reserva.add(null);
			reserva.add(null);
			reserva.add(null);
			reserva.add(null);
		
			for(int i=0; i>reserva.size() ; i++) {
				Reserva re= new Reserva(i, i, i, i, null, i);
			}
			
			//hacer setAttribute de las reservas
			Reserva re= (Reserva) sesion.getAttribute("reserva");
			//respuesta usuario
			request.getRequestDispatcher("index.jsp?sec=indexPerfil?sub=reserva").forward(request, response);
			break;	
			
			
			
		case "cupones":
			//obtner todos los cupones
			//dispatch
			
			break;
		default:
	}
		
		//GUARDAR Y EDITAR DATOS
		if(subseccion.equalsIgnoreCase("editar")) {
			try {
				
				BilboSKP.actualizarSuscripcion(null);
			} catch (Throwable e) {
				
				e.printStackTrace();
			}
		}
		
		
		//CERRAR SESION
		
		
		
		//Enviar la respuesta al usuario
		request.getRequestDispatcher("index.jsp?sec=indexPerfil").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
