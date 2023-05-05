package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PartidaOnline;

@WebServlet("/unirse")
public class ServletUnirse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String codInvitacion = request.getParameter("codInvitacion");
			boolean codigoCorrecto = PartidaOnline.usarCodigoInvitacion(Integer.parseInt(codInvitacion));
			if(codigoCorrecto==true) {
				System.out.println("El codigo proporcionado concuerda con una partida en curso");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ServletUnirse, error");
		}
	}
}
