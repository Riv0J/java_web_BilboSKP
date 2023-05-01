package control;

import java.io.IOException;
import java.util.Date;
import java.util.Vector;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Horario;
import model.Sala;
import model.SalaFisica;

@WebServlet({ "/verSala", "/reservar<das/*" })
public class ServletVerSala extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletVerSala() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget verSala");
		//obtener los datos del request
		String idSala = request.getParameter("idSala");
		String fechaSeleccionada = request.getParameter("fechaAMostrar");
		if (idSala != null) {
			Sala salaAMostrar = Sala.getSalaPorId(idSala);
			if (salaAMostrar != null) {
				// determinar si la sala es fisica
				boolean esSalaFisica = false;
				if (salaAMostrar instanceof SalaFisica) {
					//si es sala fisica, hay que obtener toda la info relacionada con las reservas
					SalaFisica salaFisica = (SalaFisica) salaAMostrar;
					esSalaFisica = true;
					LocalDate fechaSeleccionadaLocalDate;
					try {
						if (fechaSeleccionada!=null) {
							fechaSeleccionadaLocalDate = LocalDate.parse(fechaSeleccionada);
						} else {
							fechaSeleccionadaLocalDate = LocalDate.now();
						}
					} catch (Exception e) {
						fechaSeleccionadaLocalDate = LocalDate.now();
					}

					//colocar informacion en el request, sobre las fechas y horarios
					request.setAttribute("fechaSeleccionada", fechaSeleccionadaLocalDate);
					request.setAttribute("fechasAMostrar", salaFisica.getFechasAMostrar());
					request.setAttribute("horariosAMostrar", salaFisica.getVectorHorariosDisponibles(fechaSeleccionadaLocalDate));
				}
				
				// poner atributos del request, para que la seccion pueda mostrar la info
				request.setAttribute("salaAMostrar", salaAMostrar);
				request.setAttribute("esSalaFisica", esSalaFisica);
				System.out.println("Ver la sala: " + salaAMostrar.getNombre());
				// enviar al cliente a la seccion con id sala
				request.getRequestDispatcher("./index.jsp?sec=verSala&idSala=" + idSala).forward(request, response);
				return;
			} else {
				System.out.println("No se ha podido encontrar la sala solicitada: '"+idSala+"'");
			}
		}
		// si no se encuentra el id de la sala que el usuario quierr ver, se le manda a
		// ver todas las salas
		response.sendRedirect("./salas?buscar=todas&m=todas&t=todas&d=todas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
