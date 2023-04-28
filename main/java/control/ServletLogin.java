package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
           
            
          //Comprobamos si el usuario y contraseña son válidos
			Suscriptor usuarioLogueado = BilboSKP.loginSuscriptor(email, pass);
			if(usuarioLogueado!=null) {
				 System.out.println("bienvenido "+email);
				System.out.println("se pudo logear el usuario");
				HttpSession sesion = request.getSession();
				sesion.setAttribute("suscriptor", usuarioLogueado.getNombre());
				//para obtener el suscriptor tendre que escribir sesion.getattribute.
				request.getRequestDispatcher("./index.jsp?sec=inicio").forward(request, response);
			}else {
				System.out.println("no se pudo loguear el usuario");
				//avisar al usuario que sus datos son incorrectos, crear un objeto mensaje.
				request.setAttribute("errorMessage", "Usuario o contraseña incorrectos");
	            request.getRequestDispatcher("./index.jsp?sec=login").forward(request, response);
			}
		} catch (Throwable e) {
			// avisar al usuario 
			request.setAttribute("errorMessage", "Hubo un error, intentelo de nuevo mas adelante");
            request.getRequestDispatcher("./index.jsp?sec=login").forward(request, response);
		}
		doGet(request, response);
	}

}
