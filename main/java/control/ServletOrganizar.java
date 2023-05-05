package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			Suscriptor anfitrion = (Suscriptor) suscriptor;
			Sala sala=SalaOnline.getSalaPorId(idSala);
			PartidaOnline partidaOnline= new PartidaOnline(sala, anfitrion, sala.getJugadoresMax(), idSala);
			partidaOnline.getCodInvitacion();
			System.out.println("Organizando nueva partida de sala"+ sala.getNombre());
			System.out.println("Codigo de invitacion de esta partida"+ partidaOnline.getCodInvitacion());
			request.setAttribute("partidaOnline", partidaOnline);
			
			request.getRequestDispatcher("index.jsp?sec=organizar").forward(request, response);
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
