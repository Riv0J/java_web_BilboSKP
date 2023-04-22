package control;

import java.io.IOException;
import java.sql.SQLException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Vector;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Sala;
import model.SalaFisica;
import model.SalaOnline;
import view.Mensaje;

@WebServlet("/salas")
public class ServletSalas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget Salas");
		try {
			HashMap<String, Sala> mapaSalas = Sala.getTodasLasSalasCargadas();
			HashMap<String, Sala> salasAMostrar = new HashMap<String, Sala>();

			// Obtener los parámetros de búsqueda de la solicitud HTTP
			String paramBuscar = request.getParameter("buscar");
			String busquedaNormalizada = null;
			String paramModalidad = request.getParameter("m");
			String paramTematica = request.getParameter("t");
			String paramDificultad = request.getParameter("d");

			if (paramBuscar != null) {
				// normalizar(quitar acentos y poner minusculas)
				paramBuscar = normalizarTexto(paramBuscar);
			}

			// Iterar el mapa de salas cargadas y agregar las que cumplen los criterios de
			// búsqueda al mapa de salas a mostrar
			for (Map.Entry<String, Sala> entry : mapaSalas.entrySet()) {
				Sala sala = entry.getValue();

				// filtrar valor de busqueda
				if (paramBuscar != null) {
					if(!paramBuscar.equals("todas")) {
						// se tiene que normalizar el texto(minusculas y sin acentos)
						// si el nombre de la sala no contiene el parametro buscar, se salta esta sala
						String nombreSalaNormalizada = normalizarTexto(sala.getNombre());
						if (!nombreSalaNormalizada.contains(paramBuscar))
							continue;
					}
				}
				// filtrar valor de modalidad
				if (paramModalidad != null) {
					switch (paramModalidad) {
					case "online":
						if (!(sala instanceof SalaOnline)) {
							continue;
						}
						break;
					case "fisicas":
						if (!(sala instanceof SalaFisica)) {
							continue;
						}
						break;
					default:
					}
				}

				// filtrar valor de tematica
				if (paramTematica != null) {

					String tematicaNormalizada = normalizarTexto(sala.getTematica());
					// si el tematica de la sala no es igual el parametro tematica, se salta esta
					// sala
					if (!paramTematica.equals("todas") && !paramTematica.equals(tematicaNormalizada)) {
						continue;
					}
				}

				// filtrar valor de dificultad
				if (paramDificultad != null) {
					String dificultadNormalizada = normalizarTexto(sala.getDificultad());
					// si la dificultad de la sala no es igual el parametro dificultad, se salta
					// esta sala
					if (!paramDificultad.equals("todas") && !paramDificultad.equals(dificultadNormalizada)) {
						continue;
					}
				}

				// si pasa todos los filtros, se agrega al hashmap de las salas a mostrar
				salasAMostrar.put(entry.getKey(), sala);
			}

			// Agregar los atributos necesarios a la solicitud HTTP
			request.setAttribute("mapaSalas", salasAMostrar);
			request.setAttribute("tematicasDisponibles", Sala.getTematicasCargadas());
			request.setAttribute("dificultadesDisponibles", Sala.getDificultadesCargadas());

			// Enviar la respuesta al usuario
			request.getRequestDispatcher("index.jsp?sec=salas&buscar=" + paramBuscar + "&m=" + paramModalidad
					+ "&t=" + paramTematica + "&d=" + paramDificultad).forward(request, response);
		} catch (

		Throwable e) {
		}

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			BilboSKP.cargarSalasFisicas();
			BilboSKP.cargarSalasOnline();
			BilboSKP.cargarTematicas();
			BilboSKP.cargarDificultades();
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}

	public static String normalizarTexto(String texto) {
		return Normalizer.normalize(texto, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "").toLowerCase();
	}
}
