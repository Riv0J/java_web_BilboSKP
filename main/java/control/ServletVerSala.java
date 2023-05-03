package control;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.Vector;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Horario;
import model.Sala;
import model.SalaFisica;
import view.StringHelper;

@WebServlet({"/verSala"})
public class ServletVerSala extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletVerSala() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget verSala");
		// obtener los datos del request
		String idSala = request.getParameter("idSala");
		String fechaSeleccionada = request.getParameter("fechaSeleccionada");
		if (idSala != null) {
			System.out.println("Servlet ver sala: Sala a mostrar = " + idSala);
			Sala salaAMostrar = Sala.getSalaPorId(idSala);
			if (salaAMostrar != null) {
				// determinar si la sala es fisica
				boolean esSalaFisica = false;
				if (salaAMostrar instanceof SalaFisica) {
					// si es sala fisica, hay que obtener toda la info relacionada con las reservas
					SalaFisica salaFisica = (SalaFisica) salaAMostrar;
					esSalaFisica = true;
					LocalDate fechaSeleccionadaLocalDate;
					try {
						if (fechaSeleccionada != null) {
							System.out.println("ServletVerSala fecha recibida: " + fechaSeleccionada);
							// Crear un objeto DateTimeFormatter para analizar la fecha en el formato
							// "dd/MM/yyyy"
							DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
							fechaSeleccionadaLocalDate = LocalDate.parse(fechaSeleccionada, formatter);
						} else {
							fechaSeleccionadaLocalDate = null;
						}
					} catch (Exception e) {
						System.out.println("Error tratando de convertir de string a localDate, asignando fecha null");
						fechaSeleccionadaLocalDate = null;
						e.printStackTrace();
					}

					// colocar informacion en el request, sobre las fechas y horarios
					request.setAttribute("fechaSeleccionada", fechaSeleccionadaLocalDate);
					request.setAttribute("fechasAMostrar", salaFisica.getFechasAMostrar());
					Vector<Horario> horariosDisponibles = salaFisica
							.getVectorHorariosDisponibles(fechaSeleccionadaLocalDate);
					request.setAttribute("horariosAMostrar", horariosDisponibles);
				} else {
					System.out.println("ServletVerSala: Esta no es una sala fisica");
				}

				// poner atributos del request, para que la seccion pueda mostrar la info
				request.setAttribute("salaAMostrar", salaAMostrar);
				request.setAttribute("esSalaFisica", esSalaFisica);
				
				//establecer la url a otorgar como url previa
				String urlPrevia = "./verSala?idSala=" + idSala;
				System.out.println("ServletSalas urlprevia establecida = "+urlPrevia);
				HttpSession sesion = request.getSession();
				sesion.setAttribute("urlPrevia", urlPrevia);
				
				String rutaDestino = "./index.jsp?sec=verSala&idSala=" + idSala;
				// enviar al cliente a la seccion con id sala
				request.getRequestDispatcher(rutaDestino).forward(request, response);
				return;
			} else {
				System.out.println("ServletVerSala: No se ha podido encontrar la sala solicitada con id: " + idSala);
			}
		} else {
			System.out.println("ServletVerSala: No hay un id para buscar la sala");
		}
		// si no se encuentra el id de la sala que el usuario quierr ver, se le manda a
		// ver todas las salas
		response.sendRedirect("./salas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
