package control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String idSala = request.getParameter("id");
			String nombregrupo = request.getParameter("nombregrupo");
			String puntos = request.getParameter("puntos");
			String fecha = request.getParameter("fecha");
			
			//sala viendose en este momento
			
			//partidas que se jugaron
			//todo esto ira como setAttribute[]
			
			//hacer llamado al metodo de ObtenerRanking(id). obtendremos vector <partidas>. 
			
			
			// Enviar la respuesta al usuario
			request.getRequestDispatcher("index.jsp?sec=ranking&oof=" + onlineoFisica + "&id=" + nombreSala)
					.forward(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}
}
