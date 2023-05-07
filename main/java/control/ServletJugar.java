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
import model.Jugador;
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
		try {
			// obtener partida del request
			String codString = request.getParameter("codInvitacion");
			String accion = request.getParameter("accion");
			int codInvitacion = Integer.parseInt(codString);
			PartidaOnline po = PartidaOnline.getPartidaOnline(codInvitacion);
			System.out.println(accion + " + " + codInvitacion);
			HttpSession sesion = request.getSession();
			// verificar que el que quiere iniciar la partida es el anfitrion
			Object sus = sesion.getAttribute("suscriptor");
			if (po != null) {
				System.out.println("Se ha encontrado una partida");
				switch (accion) {
				case "iniciar":
					//si el estado de la partida era organizando continua
					if(po.getEstado().equals(PartidaOnline.PARTIDA_ORGANIZANDO)) {
						Suscriptor suscriptorAnfitrion = po.getAnfitrion();
						// verificar que el suscriptor tiene un cupon, y si lo tiene cambiar a su estado
						// en uso, de lo contrario redireccionar
						if (sus.equals(suscriptorAnfitrion)) {
							System.out.println("El anfitrion es correcto");
							Cupon cupon = BilboSKP.comprobarCupon("Disponible", suscriptorAnfitrion.getIdSuscriptor());
							if (cupon != null) {
								BilboSKP.usarCupon(suscriptorAnfitrion.getIdSuscriptor(), cupon.getId());
								// si el estado de la partida es organizando, comenzarla
								if (po.getEstado().equals(PartidaOnline.PARTIDA_ORGANIZANDO)) {
									po.iniciarPartida();
									// mandar al sus al juego
									SalaOnline so = (SalaOnline) po.getSala();
									Escenario escenarioAMostrar = so.getEscenarioInicio();
									if (escenarioAMostrar == null) {
										Mensaje m = new Mensaje(
												"Esta sala no está disponible actualmente, ¡por favor disfruta pregunta al staff!",
												Mensaje.MENSAJE_INFO);
										sesion.setAttribute("mensaje", m);
										request.getRequestDispatcher("./salas").forward(request, response);
									} else {
										request.setAttribute("escenarioAMostrar", escenarioAMostrar);
										request.setAttribute("partidaOnline", po);
										request.getRequestDispatcher("juego.jsp").forward(request, response);
									}
								}
							}
						}
					}
					break;
				case "salir":
					po.quitarJugador(sesion);
					// si la sesion que se quita es el anfitrion, termina la partida
					if (sesion.equals(po.getSessionJugadorAnfitrion())) {
						po.finalizarPartida();
					}
					// redireccionar a salas
					response.sendRedirect("./salas");
					break;
				case "cambioEscenario":
					String idEscenarioDestino = request.getParameter("idEscenarioDestino");
					// obtener sala
					SalaOnline so = (SalaOnline) po.getSala();
					// obtener el escenario concreto a dibujar
					// Escenario escenario = SalaOnline
					// insertar escenario en el request
					// redireccionar al juego.jsp
					request.getRequestDispatcher("juego.jsp").forward(request, response);
					break;
				default:
					response.sendRedirect("./salas");
					break;
				}
			}
		} catch(Throwable e) {
			e.printStackTrace();
			response.sendRedirect("./salas");
		}
	}

	// este dopost atenderá todas las peticiones
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String accion = request.getParameter("accion");
			String stringCodInvitacion = request.getParameter("codInvitacion");

			int codInvitacion = Integer.parseInt(stringCodInvitacion);
			PartidaOnline po = PartidaOnline.getPartidaOnline(codInvitacion);
			HttpSession sesion = request.getSession();

			switch (accion) {
			case "salir":

				break;
			
			case "chatear":
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("./salas");
		}
	}
}
