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
import model.SalaFisica;
import model.SalaOnline;

@WebServlet({ "/ranking" })
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
			HashMap<String, SalaOnline> salasAMostrar = new HashMap<String, SalaOnline>();
			
		
			
			// Obtener los parametros de la sala que queremos ver el ranking
			String idSala = request.getParameter("idSala");

			// si no hay sala seleccionada forzar la primera

			if (idSala == null) {
				idSala = "SO1";
			}
			System.out.println("idSala= " + idSala);

			for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
				par.getKey();
				System.out.println(par.getKey());
				if(par.getValue() instanceof SalaOnline) {
					salasAMostrar.put(par.getKey(), (SalaOnline) par.getValue());
					System.out.println(par.getValue().getNombre());
				}
			}

			// sala viendose en este momento
			Sala salaSeleccionada = Sala.getSalaPorId(idSala);
			if(salaSeleccionada instanceof SalaFisica)
				salaSeleccionada =Sala.getSalaPorId("SO1");
					System.out.println("Era una sala Fisica");
			request.setAttribute("salaSeleccionada", salaSeleccionada);
			System.out.println("Sala seleccionada: " + salaSeleccionada.getNombre());

			// partidas que se jugaron
			// todo esto ira como setAttribute[]

			// hacer llamado al metodo de ObtenerRanking(id). obtendremos vector <partidas>.
			Vector<PartidaOnline> partidas = new Vector<PartidaOnline>();
			partidas = BilboSKP.obtenerRankingSalaOnline(salaSeleccionada.getIdSala());

			// verificar que hay partidas / vector de partidas
			for (PartidaOnline partida : partidas) {
				Sala sala = partida.getSala();
				String nombregrupo = partida.getNombreGrupo();
				String puntos = Integer.toString(partida.getPuntaje());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String fecha = sdf.format(partida.getFechaInicio());
				System.out.println(sala.getIdSala());

			}
			// poner atributos del request, para que la seccion pueda mostrar la info
			request.setAttribute("partidas", partidas);
			request.setAttribute("salasAMostrar", salasAMostrar);
			// Enviar la respuesta al usuario

			request.getRequestDispatcher("index.jsp?sec=ranking&sala=" + salaSeleccionada.getIdSala()).forward(request,
					response);

		} catch (Throwable e) {
			e.printStackTrace();
			System.out.println("Error conexion ranking");
		}

	}
}
