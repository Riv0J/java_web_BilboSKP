package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PartidaOnline;
import model.Sala;
import model.SalaOnline;

@WebServlet("/unirse")
public class ServletUnirse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doget unirse");
		try {
			String idSala = request.getParameter("idSala");
			String codInvitacion = request.getParameter("codInvitacion");
			SalaOnline so = (SalaOnline) Sala.getSalaPorId(idSala);
			System.out.println("Intento de unirse a partida de sala id "+so.getNombre()+". Con el codigo "+codInvitacion);
			boolean codigoCorrecto = PartidaOnline.usarCodigoInvitacion(Integer.parseInt(codInvitacion));
			if(codigoCorrecto==true) {
				System.out.println("El codigo proporcionado concuerda con una partida en curso");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ServletUnirse, error");
		}
		response.sendRedirect("./salas");
	}
}
