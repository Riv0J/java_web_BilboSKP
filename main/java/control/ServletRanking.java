package control;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doget ranking");
		try {
			// 1. Obtener los parametros necesarios para mostrar la info
			
			
		}
			catch (Throwable e) {
				e.printStackTrace();
			}
		
		
	}
}

