package control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Reserva;

/**
 * Servlet implementation class ServletReserva
 */
@WebServlet("/ServletReserva")
public class ServletReserva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 try {
			//Reservas
			HashMap<String, Reserva> reservas= new HashMap<String, Reserva>();	
			//obtener sus de la sesion 
			//obtener reserva sus
			//meter resevas request
			//redireccionar al request
			//obtener parametros de reserva
			
			String idReserva= request.getParameter("idReserva");
			
			
		 }catch(Throwable e ){
			 
		 }
		

		
	}
	
	
	
	
	
	
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
