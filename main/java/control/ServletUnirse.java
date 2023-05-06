package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Anfitrion;
import model.Invitado;
import model.PartidaOnline;
import model.Sala;
import model.SalaOnline;
import view.Mensaje;

@WebServlet("/unirse")
public class ServletUnirse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doget unirse");
		HttpSession sesion = request.getSession();
		Mensaje mensaje = null;
		boolean exito = false;
		try {
			String codInvitacion = request.getParameter("codInvitacion");
			System.out.println("Intento de unirse a partida con el codigo "+codInvitacion);
			PartidaOnline po = PartidaOnline.usarCodigoInvitacion(Integer.parseInt(codInvitacion));
			if(po!=null) {
				String agregarJugador = po.agregarJugador(sesion);
				switch (agregarJugador) {
				case "Agregado":
					exito = true;
					System.out.println("El codigo proporcionado concuerda con una partida en curso");
					mensaje = new Mensaje("Te has unido a la partida online", Mensaje.MENSAJE_EXITO);
					sesion.setAttribute("mensaje", mensaje);
					if(!(sesion.getAttribute("jugador") instanceof Anfitrion)) {
						sesion.setAttribute("jugador", new Invitado());
					}
					request.setAttribute("partidaOnline", po);
					request.getRequestDispatcher("index.jsp?sec=organizar&codInvitacion="+codInvitacion).forward(request, response);
					break;
				case "Ya estaba agregado":
					exito = true;
					System.out.println("El codigo proporcionado concuerda con una partida en curso");
					mensaje = new Mensaje("Te has unido a la partida online", Mensaje.MENSAJE_EXITO);
					sesion.setAttribute("mensaje", mensaje);
					request.setAttribute("partidaOnline", po);
					request.getRequestDispatcher("index.jsp?sec=organizar&codInvitacion="+codInvitacion).forward(request, response);
					break;
				case "Lleno":
					
					break;
				default:
					break;
				}
			} else {
				System.out.println("No se ha encontrado una partida con ese código");
				mensaje = new Mensaje("No se ha encontrado una partida con ese código", Mensaje.MENSAJE_ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ServletUnirse, error");
		}
		sesion.setAttribute("mensaje", mensaje);
		if (exito = false){
			//redireccionamiento
			System.out.println("El objeto Suscriptor no existe en la sesión");
			try {
				String urlPrevia = (String) sesion.getAttribute("urlPrevia");
				if (urlPrevia instanceof String) {
					System.out.println("ServletLogin: habia una url previa: "+urlPrevia);
					((HttpServletResponse) response).sendRedirect((String) urlPrevia);
				} else {
					System.out.println("ServletLogin: NO url previa establecida = "+urlPrevia);
					((HttpServletResponse) response).sendRedirect("index.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				((HttpServletResponse) response).sendRedirect("index.jsp");
			}
		}
		
	}
}
