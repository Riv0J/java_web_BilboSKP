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

@WebServlet("/perfil , /reserva")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	String subseccion =	request.getParameter("subseccion");
	if(subseccion==null) {
		subseccion="editar";
	}
	//que todos los datos aparezcan cuando el suscriptor esta logeado	
	//obtener el suscriptor de la sesion 
	//Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor");
	
		HttpSession sesion = request.getSession();
		Suscriptor sus= new Suscriptor(1, 1234, "hola@gmail,com" , "pau", "paula", "castillo", "imagen", 1 , null);
	
		sesion.setAttribute("sus", sus);
		switch (subseccion) {
		case"editar":
			request.getRequestDispatcher("index.jsp?sec=perfil").forward(request, response);
			break;
		case "reservas":
			//obtener todas las reservas del suscriptor 
			ArrayList <Reserva> reserva=new ArrayList<Reserva>();
			
			//hacer setAttribute de las reservas
			Reserva r= (Reserva) sesion.getAttribute("reserva");
			//respuesta usuario
			request.getRequestDispatcher("index.jsp?sec=reserva").forward(request, response);
			break;		
		case "cupones":
			//obtner todos los cupones
			//dispatch
			
			break;
		default:
			break;
		}
		
		//Guadar los datos modificados
	
		
		
		//cerrar sesion
		
		
		
		//Enviar la respuesta al usuario
		request.getRequestDispatcher("index.jsp?sec=perfil").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
