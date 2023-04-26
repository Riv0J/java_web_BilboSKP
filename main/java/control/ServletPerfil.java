package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Suscriptor;

@WebServlet("/ServletPerfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// metodos que se usarna desde la clase BilnoSKP
	// ACTUALIZARSUSCRIPCION
	// CREARSUSCRIPCION
	// LOGINSUSCRIPTOR
	// getadatosSuscriptor

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	//que todos los datos aparezcan cuando el suscriptor esta logeado	
	//obtener el suscriptor de la sesion 
	//Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor");
		
		
		HttpSession sesion = request.getSession();
		Suscriptor sus= new Suscriptor(1, 1234, "hola@gmail,com" , "pau", "paula", "castillo", "imagen", 1 , null);
	
		if(sus!=null) {
			sus.setAlias("pau");
			sus.setNombre("paula");
			sus.setApellidos("castillo");
			sus.setEmail("hola@gmail.com");
			sus.setFech_nac(null);
			sus.setTelefono(1234);
			sus.setImagen("imagen");
			
		}
		sesion.setAttribute("sus", sus);
		
		
	//Guadar los datos modificados
	
		
		
	//cerrar sesion
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
