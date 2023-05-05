package control;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PartidaOnline;
import model.Sala;
import model.SalaFisica;
import model.SalaOnline;
import model.Suscriptor;

/**
 * Servlet implementation class ServletReservar
 */
@WebServlet("/reservar")
public class ServletReservar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		Object sus = (Object) sesion.getAttribute("suscriptor");
		
		
		
		if(sesion.getAttribute("suscriptor")==null) {
			sesion.setAttribute("mostrarLogin", "si");
			request.getRequestDispatcher("index.jsp?sec=verSala").forward(request, response);
			
		}else {
			if(sus instanceof Suscriptor) {
				Suscriptor suscriptor = (Suscriptor) sus;
				//obtener id sala fisica
				
				String idSala = request.getParameter("idSala");
				int longitudDelIdSala= idSala.length();
				int idSalaSinLetras = Integer.parseInt(idSala.substring(2,longitudDelIdSala)); // Extrae los caracteres desde el índice 3 hasta el 6 (sin incluirlo)
				
				
				//obtener id suscriptor
				int idSuscriptor = ((Suscriptor) sus).getIdSuscriptor();
				//obtener num jugadores
				int num_jugadores = Integer.parseInt(request.getParameter("num_jugadores"));
				//obtener fecha hora
				String fechaHora = request.getParameter("horarios");
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
				LocalDateTime fecha = LocalDateTime.parse(fechaHora, formatter);
				
				DateTimeFormatter nuevoFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String fechaSQL = fecha.format(nuevoFormatter);
				System.out.println(fechaSQL);
				
				

				


				
				
				System.out.println(idSala);
				int idSuscrptor =((Suscriptor) sus).getIdSuscriptor();
				System.out.println(num_jugadores);
				System.out.println(idSalaSinLetras);
				


				
				
				
				
				Sala sala=SalaFisica.getSalaPorId(idSala);
				
				try {
					BilboSKP.crearReserva(idSalaSinLetras, idSuscrptor, num_jugadores, fechaSQL, 1);
					request.getRequestDispatcher("./verSala?idSala="+idSala);
					//hacer otra con sulta de update para poner en no disponible osea 0, ese horario
				
				} catch (Throwable e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} 
			
			
			
		}
	}

}
