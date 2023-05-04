package control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import java.util.Map.Entry;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cupon;
import model.PartidaOnline;
import model.Sala;
import model.SalaOnline;
import model.Suscriptor;

/**
 * Servlet implementation class ServletReiniciarRanking
 */
@WebServlet("/reiniciarRanking")
public class ServletMantenimientoRanking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			BilboSKP.cargarSalasOnline();

		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//metodo para reiniciar ranking dando premios
		String premiar=request.getParameter("premiar");
		// get de todas las salas
		SalaOnline.getSalasCargadas();
		HashMap<Integer, SalaOnline> mapaSalas = SalaOnline.getSalasCargadas();

		// hacer for
		for (Entry<Integer, SalaOnline> par : mapaSalas.entrySet()) {
			SalaOnline so = par.getValue();
			Integer id = par.getKey();

			try {
				if(premiar=="premiar") {
					Vector<PartidaOnline> vectorPartidas = BilboSKP.obtenerRankingSalaOnline(id);
					for(PartidaOnline parti: vectorPartidas) {	
					Suscriptor sus= parti.getAnfitrion();
					BilboSKP.otorgarCupon(Cupon.CUPON_RANKING, sus.getIdSuscriptor());
					
				}
			}
				
				
				BilboSKP.ReiniciarRanking(id);

				
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
