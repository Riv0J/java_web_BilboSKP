package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletSubscribe
 */
@WebServlet("/subscribe")
public class ServletSubscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSubscribe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String alias = request.getParameter("alias");
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		
		 // Obtener el valor del parámetro de entrada de fecha
		String fech_nac = request.getParameter("fech_nac");

	    // Crear un objeto SimpleDateFormat con el patrón de fecha
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	   
	      // Convertir la cadena de fecha en un objeto Date
	      try {
			Date fechaNacimiento = dateFormat.parse(fech_nac);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("formato de date inadecuado");
		}
	      
		try {
			BilboSKP.crearSuscripcion(email, pass, telefono, alias, nombre, apellidos, fech_nac);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("no se pudo crear suscripcion");
		}
		doGet(request, response);


	    
}
}
