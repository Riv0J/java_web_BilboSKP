package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cupon;
import model.Suscriptor;

/**
 * Servlet implementation class ServletTienda
 */
@WebServlet("/tienda")
public class ServletTienda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget tienda");
		
		HttpSession sesion = request.getSession();
		Suscriptor sus = (Suscriptor) sesion.getAttribute("suscriptor");
		
		//comprobar si
		
		//comprobar si se está suscrito 
		if(sus!=null) {
			//los cupones comprados irán a la cuenta de sus
			int susID = sus.getIdSuscriptor();
			try {
				BilboSKP.otorgarCupon("Regular", susID);
				System.out.println("cupon regular comprado");
			} catch (Throwable e) {
				System.out.println("cupon regular NO comprado");
				e.printStackTrace();
			}
		}else{
			//ofrecer registro
			System.out.println("suscribirte?");
			request.getRequestDispatcher("./subscribe").forward(request,
					response);;
		}

	
	
	
	
	
	}

	

}