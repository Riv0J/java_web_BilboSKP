package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Partida;
import model.PartidaOnline;
import model.Sala;

/**
 * Servlet implementation class Ranking
 */
@WebServlet({ "/Ranking", "/ranking" })
public class ServletRanking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			BilboSKP.cargarSalasFisicas();
			BilboSKP.cargarSalasOnline();

		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doget ranking");
		try {
			// 1. Obtener los parametros necesarios para mostrar la info
			HashMap<String, Sala> mapaSalas = Sala.getTodasLasSalasCargadas();
			// Obtener los parametros de la sala que queremos ver el ranking
			String idSala = request.getParameter("idSala");

			// si no hay sala seleccionada forzar la primera

			if (idSala == null) {
				idSala = "SO1";
			}
			System.out.println("idSala= " + idSala);

			HashMap<String, Sala> salas = Sala.getTodasLasSalasCargadas();
			for (Map.Entry<String, Sala> sala : mapaSalas.entrySet()) {
				sala.getKey();
				System.out.println(sala.getKey());
			}

			// sala viendose en este momento
			Sala salaSeleccionada = Sala.getSalaPorId(idSala);
			request.setAttribute("salaSeleccionada", salaSeleccionada);
			System.out.println("Sala seleccionada: " + salaSeleccionada.getNombre());

			// partidas que se jugaron
			// todo esto ira como setAttribute[]

			// hacer llamado al metodo de ObtenerRanking(id). obtendremos vector <partidas>.
			Vector<PartidaOnline> partidas = new Vector<PartidaOnline>();
			partidas = BilboSKP.obtenerRankingSalaOnline(salaSeleccionada.getIdSala());

			// recorrer vector de partidas
			for (PartidaOnline partida : partidas) {
				Sala sala = partida.getSala();
				String nombregrupo = partida.getNombreGrupo();
				String puntos = Integer.toString(partida.getPuntaje());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String fecha = sdf.format(partida.getFechaInicio());
				System.out.println(nombregrupo);

				// poner atributos del request, para que la seccion pueda mostrar la info
				request.setAttribute("nombregrupo", nombregrupo);
				request.setAttribute("puntos", puntos);
				request.setAttribute("fecha", fecha);
				request.setAttribute("salaseleccionada", salaSeleccionada);
				request.setAttribute("sala", sala);
				request.setAttribute("partidas", partidas);
				// Enviar la respuesta al usuario

				request.getRequestDispatcher("index.jsp?sec=ranking&sala=" + salaSeleccionada.getNombre())
						.forward(request, response);

			}
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}
}
