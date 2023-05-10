package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Suscriptor;


@WebServlet("/contacto")
public class ServletContacto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		
		
		System.out.println("Doget contacto");
		String urlPrevia = "./Contacto";
		System.out.println("ServletContacto urlprevia establecida = " + urlPrevia);
		HttpSession sesion = request.getSession();
		sesion.setAttribute("urlPrevia", urlPrevia);	

		// Enviar la respuesta al usuario
		request.getRequestDispatcher("index.jsp?sec=contacto").forward(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
