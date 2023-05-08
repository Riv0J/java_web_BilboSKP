package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Anfitrion;
import model.Cupon;
import model.PartidaOnline;
import model.Sala;
import model.SalaOnline;
import model.Suscriptor;

@WebServlet("/organizar")
public class ServletOrganizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletOrganizar() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doget Organizar sala");
		HttpSession sesion = request.getSession();
		String idSala = request.getParameter("idSala");
		Object suscriptor = (Object) sesion.getAttribute("suscriptor");
		
		if(suscriptor instanceof Suscriptor) {
			Suscriptor suscriptorAnfitrion = (Suscriptor) suscriptor;
			
			//chequear si el suscriptor ya estaba iniciando una partida
			PartidaOnline po = PartidaOnline.buscarPartidaPorAlias(suscriptorAnfitrion.getAlias());
			if (po != null) {
				//po.cancelarPartida();
				//redireccionar y mandarlo a su partida
				request.getRequestDispatcher("./unirse?codInvitacion="+po.getCodInvitacion()).forward(request, response);
			} else {
				try {
					//checar si el sus tiene un cupon disponible:
					Cupon cupon = BilboSKP.comprobarCupon("Disponible", suscriptorAnfitrion.getIdSuscriptor());
					if(cupon!=null) {
						//si no se habia encontrado una partida a su nombre, se crea una nueva
						Sala sala=SalaOnline.getSalaPorId(idSala);
						PartidaOnline partidaOnline= new PartidaOnline(sala, suscriptorAnfitrion, sesion, sala.getJugadoresMax(), idSala);
						int codInvitacion = partidaOnline.getCodInvitacion();

						System.out.println("Organizando nueva partida de sala "+ sala.getNombre());
						System.out.println("Codigo de invitacion de esta partida "+ codInvitacion);
						//establecer la url a otorgar como url previa
						String urlPrevia = "index.jsp?sec=organizar&codInvitacion="+codInvitacion;
						System.out.println("ServletOrganizar urlprevia establecida = "+urlPrevia);
						sesion.setAttribute("urlPrevia", urlPrevia);
						//-------------------------------------------
						sesion.setAttribute("jugador", new Anfitrion(suscriptorAnfitrion));
						request.setAttribute("partidaOnline", partidaOnline);
						request.getRequestDispatcher("index.jsp?sec=organizar&codInvitacion="+codInvitacion).forward(request, response);
					} else {
						request.getRequestDispatcher("index.jsp?sec=tienda").forward(request, response);
					}
				} catch (Throwable e) {
					e.printStackTrace();
					
				}
			}
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
