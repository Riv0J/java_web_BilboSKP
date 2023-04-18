package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Suscriptor;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet(
		urlPatterns = { "/login" }, 
		initParams = { 
				@WebInitParam(name = "contenido", value = "null")
		})
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        try {
        	//Obtenemos los datos enviados desde el formulario
            String nombre = request.getParameter("nombre");
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
            
          //Comprobamos si el usuario y contraseña son válidos
			Suscriptor usuarioValido = BilboSKP.loginSuscriptor(email, pass);
			if(usuarioValido!=null) {
				System.out.println("se pudo logear el usuario");
				response.sendRedirect("index.jsp?sec=inicio");
			}else {
				System.out.println("no se pudo loguear el usuario");
				//avisar al usuario que sus datos son incorrectos, crear un objeto mensaje.
				request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
	            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			}
		} catch (Throwable e) {
			// avisar al usuario 
			response.sendRedirect("login.jsp");
		}
		doGet(request, response);
	}

}
