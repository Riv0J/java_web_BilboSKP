package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cupon;
import model.Escenario;
import model.PartidaOnline;
import model.SalaOnline;
import model.Suscriptor;
import view.Mensaje;

@WebServlet("/jugar")
public class ServletJugar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget jugar");
		// obtener partida del request
		String codString = request.getParameter("codInvitacion");
		int codInvitacion = Integer.parseInt(codString);
		PartidaOnline po = PartidaOnline.getPartidaOnline(codInvitacion);
		
		if (po!=null) {
			System.out.println("Se ha encontrado una partida");
			// obtener la sesion
			HttpSession sesion = request.getSession();
			// verificar que el que quiere iniciar la partida es el anfitrion
			Object sus = sesion.getAttribute("suscriptor");
			Suscriptor suscriptorAnfitrion = po.getAnfitrion();
			if (sus.equals(suscriptorAnfitrion)) {
				System.out.println("El anfitrion es correcto");
				// verificar que el suscriptor tiene un cupon, y si lo tiene cambiar a su estado
				// en uso, de lo contrario redireccionar
				try {
					Cupon cupon = BilboSKP.comprobarCupon("Disponible", suscriptorAnfitrion.getIdSuscriptor());
					if (cupon != null) {
						BilboSKP.usarCupon(suscriptorAnfitrion.getIdSuscriptor(), cupon.getId());
						// si el estado de la partida es organizando, comenzarla
						if (po.getEstado().equals(PartidaOnline.PARTIDA_ORGANIZANDO)) {
							po.iniciarPartida();
							//mandar al sus al juego
							SalaOnline so = (SalaOnline) po.getSala();
							Escenario escenarioAMostrar = so.getEscenarioInicio();
							if(escenarioAMostrar==null) {
								Mensaje m = new Mensaje("Esta sala no está disponible actualmente, ¡por favor disfruta pregunta al staff!",Mensaje.MENSAJE_INFO);
								sesion.setAttribute("mensaje", m);
								request.getRequestDispatcher("./salas").forward(request, response);
							} else {
								request.setAttribute("escenarioAMostrar", escenarioAMostrar);
								request.setAttribute("partidaOnline", po);
								request.getRequestDispatcher("juego.jsp").forward(request, response);
							}
						}
					}
				} catch (Throwable e) {
					e.printStackTrace();
					System.out.println("ServletJugar: Error utilizando cupon");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// obtener la sala
		String idSala = request.getParameter("idSala");
		String idEscenarioDestino = request.getParameter("idEscenarioDestino");
		// obtener el escenario concreto a dibujar

		// insertar en el request

		// edireccionar al juego.jsp

	}
}
