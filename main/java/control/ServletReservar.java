package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.compiler.Node.ForwardAction;

/**
 * Servlet implementation class ServletReservar
 */
@WebServlet("/ServletReservar")
public class ServletReservar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("suscriptor")==null) {
			sesion.setAttribute("mostrarLogin", "si");
			request.getRequestDispatcher("index.jsp?sec=verSala").forward(request, response);
			
		}else {
			//bd.registrarReserva("estado",fecha, id, clave primaria del suscriptor, num jugadores);
			//Insertar los datos de la reserva a la bd
		}
	}

}
