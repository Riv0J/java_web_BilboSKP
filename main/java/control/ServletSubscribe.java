package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Message;

import model.Suscriptor;
import view.Mensaje;

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
		System.out.println("hace dopost subscribe");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String alias = request.getParameter("alias");
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		
		 // Obtener el valor del parámetro de entrada de fecha
		String fech_nac = request.getParameter("fech_nac");
	    
	    

	   
	      // Parsear la fecha a un objeto java.util.date
		  LocalDate fecha = LocalDate.parse(fech_nac);

		  // Convertir a java.sql.date
		  java.sql.Date sqlDate = java.sql.Date.valueOf(fecha);
	      
		try {
			//crea el suscriptor
			Suscriptor sus= BilboSKP.crearSuscripcion(email, pass, telefono, alias, nombre, apellidos, sqlDate);
			
			
			if (sus!=null) {
				HttpSession sesion= request.getSession();
				sesion.setAttribute("suscriptor", sus);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				Mensaje mensaje= new Mensaje("no se pudo crear suscripcion", Mensaje.MENSAJE_ERROR);
				request.getRequestDispatcher("index.jsp?sec=subscribe").forward(request, response);
				
			}
			
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("no se pudo crear suscripcion");
			Mensaje mensaje= new Mensaje("no se pudo crear suscripcion", Mensaje.MENSAJE_ERROR);
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("index.jsp?sec=subscribe").forward(request, response);
		}


	    
}
}
