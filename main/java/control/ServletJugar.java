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
import model.MensajeChat;
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
			System.out.println("Jugar accion = " + accion + " cod = " + codInvitacion);
			HttpSession sesion = request.getSession();
			// verificar que el que quiere iniciar la partida es el anfitrion
			Jugador jugador = (Jugador) sesion.getAttribute("jugador");
			String nombreEscenarioDestino = "";
			PartidaOnline po = null;
			SalaOnline so = null;
			switch (accion) {
			case "iniciar":
				// en caso de que sea iniciar se busca partida organizando
				po = PartidaOnline.getPartidaOrganizando(codInvitacion);
				if (po == null) {
					po = PartidaOnline.getPartidaEnCurso(codInvitacion);
				}
				if (po.getEstado().equals(PartidaOnline.PARTIDA_ORGANIZANDO)) {
					Suscriptor suscriptorAnfitrion = po.getAnfitrion();
					// verificar que el suscriptor tiene un cupon, y si lo tiene cambiar a su estado
					// en uso, de lo contrario redireccionar
					if (sesion.equals(po.getSessionJugadorAnfitrion())) {
						System.out.println("ServletJugar: El anfitrion es correcto");
						Cupon cupon = BilboSKP.comprobarCupon("Disponible", suscriptorAnfitrion.getIdSuscriptor());
						if (cupon != null) {
							BilboSKP.usarCupon(suscriptorAnfitrion.getIdSuscriptor(), cupon.getId());
							boolean iniciada = po.iniciarPartida();
							if (iniciada == false) {
								Mensaje m = new Mensaje("No se cumplen los jugadores mínimos para iniciar la partida",Mensaje.MENSAJE_ERROR);
								sesion.setAttribute("mensaje", m);
								request.getRequestDispatcher("index.jsp?sec=organizar&codInvitacion="+codInvitacion).forward(request, response);
								return;
							}
							po.setCupon(cupon);
							// mandar al sus al juego
							so = (SalaOnline) po.getSala();
							Escenario escenarioAMostrar = so.getEscenarioInicio();
							if (escenarioAMostrar == null) {
								Mensaje m = new Mensaje("Esta sala no está disponible actualmente, ¡por favor disfruta pregunta al staff!", Mensaje.MENSAJE_INFO);
								sesion.setAttribute("mensaje", m);
								request.getRequestDispatcher("./salas").forward(request, response);
							} else {
								request.setAttribute("escenarioAMostrar", escenarioAMostrar);
								request.setAttribute("partidaOnline", po);
								request.getRequestDispatcher("juego.jsp").forward(request, response);
							}
						}
					} else {	
					}
				}
				break;
			case "salir":
				po = PartidaOnline.getPartidaEnCurso(codInvitacion);
				Mensaje mensaje;
				// si la sesion que se quita es el anfitrion, termina la partida
				if (sesion.equals(po.getSessionJugadorAnfitrion())) {
					po.finalizarPartida();
					mensaje = new Mensaje("La partida ha finalizado, eras el anfitrión.",Mensaje.MENSAJE_INFO);
				} else {
					mensaje = new Mensaje("Has salido de la partida.",Mensaje.MENSAJE_INFO);
					po.quitarJugador(sesion);
				}
				// en cualquier caso, redireccionar a salas
				sesion.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("./salas").forward(request, response);
				break;
			case "cambioEscenario":
				po= PartidaOnline.getPartidaEnCurso(codInvitacion);
				nombreEscenarioDestino = request.getParameter("idEscenarioDestino");
				// obtener sala
				so = (SalaOnline) po.getSala();
				// obtener el escenario concreto a dibujar
				Escenario escenarioAMostrar = so.getEscenarioPorNombre(nombreEscenarioDestino);
				// insertar datos en el request
				request.setAttribute("escenarioAMostrar", escenarioAMostrar);
				request.setAttribute("partidaOnline", po);
				// redireccionar al juego.jsp
				request.getRequestDispatcher("juego.jsp").forward(request, response);
				break;
			case "finalizar":
				po= PartidaOnline.getPartidaEnCurso(codInvitacion);
				po.setSuperada(true);
				po.finalizarPartida();
				BilboSKP.cambiarEstadoCupon("Gastado", po.getCupon().getId());
				request.setAttribute("partidaOnline", po);
				// redireccionar
				request.getRequestDispatcher("index.jsp?sec=finalizarPartida").forward(request, response);
				break;
			default:
				response.sendRedirect("./salas");
				break;
			}
		} catch (Throwable e) {
			e.printStackTrace();
			response.sendRedirect("./salas");
		}
	}

	// este dopost atenderá algunas las peticiones
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// obtener partida del request
			String codString = request.getParameter("codInvitacion");
			String accion = request.getParameter("accion");
			int codInvitacion = Integer.parseInt(codString);
			System.out.println("Do Post Jugar accion = " + accion + " cod = " + codInvitacion);
			HttpSession sesion = request.getSession();
			// verificar que el que quiere iniciar la partida es el anfitrion
			Jugador jugador = (Jugador) sesion.getAttribute("jugador");
			String nombreEscenarioDestino = "";
			PartidaOnline po = null;
			SalaOnline so = null;

			switch (accion) {
			case "chatear":
				po = PartidaOnline.getPartidaEnCurso(codInvitacion);
			    String cacheControlHeader = request.getHeader("Cache-Control");
			    if (cacheControlHeader != null && cacheControlHeader.contains("max-age=0")) {
			        // La solicitud se realizó mediante un refresco de página
			    	//crear el mensaje de chat
					String mensajeChat = request.getParameter("mensajeChat");
					System.out.println("Nuevo mensaje de chat de "+jugador.getAlias()+": "+mensajeChat);
					po.addChat(jugador, mensajeChat);
			    } else {
			    }
				// obtener el escenario concreto a dibujar
				nombreEscenarioDestino = request.getParameter("escenarioAMostrar");
				so = (SalaOnline) po.getSala();
				Escenario escenarioAMostrar = so.getEscenarioPorNombre(nombreEscenarioDestino);
				System.out.println("Escenario destino ="+nombreEscenarioDestino);
				// insertar datos en el request
				request.setAttribute("partidaOnline", po);
				request.setAttribute("escenarioAMostrar", escenarioAMostrar);
				// redireccionar al juego.jsp
				request.getRequestDispatcher("juego.jsp").forward(request, response);
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
