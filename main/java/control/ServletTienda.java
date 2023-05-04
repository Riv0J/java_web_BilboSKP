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
		System.out.println("Doget tienda");
		
		//redireccionamiento: establecer la url a mandar como url previa en la sesion
		String urlPrevia = "./tienda";
		System.out.println("ServletTienda urlprevia establecida = "+urlPrevia);
		HttpSession sesion = request.getSession();
		sesion.setAttribute("urlPrevia", urlPrevia);
		//---------------------------------------------------------------------------//
		
		
		Suscriptor sus = (Suscriptor) sesion.getAttribute("suscriptor");
	
		String accion = request.getParameter("tienda");
		if (accion==null) {
			accion ="";
		}
		switch (accion) {
		case "comprar":
			
			break;

		default:
			break;
		}
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
