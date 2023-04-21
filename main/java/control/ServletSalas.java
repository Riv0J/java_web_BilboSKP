package control;

import java.io.IOException;
import java.sql.SQLException;
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
import model.SalaOnline;
import view.Mensaje;

@WebServlet("/salas")
public class ServletSalas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget Salas");
		try {
			// 1. Obtener los parametros necesarios para saber que salas mostrar
			HashMap<String, Sala> mapaSalas;
			String search = request.getParameter("buscar");
			String modalidad = request.getParameter("modalidad");
			String tematica = request.getParameter("tematica");
			
			if (search == null || search.equalsIgnoreCase("todas")) {
				System.out.println("Mostrando todas las salas");
				mapaSalas = Sala.getTodasLasSalasCargadas();
			} else {
				mapaSalas = Sala.getTodasLasSalasCargadas();
			}

			for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
				System.out.println(par.getValue().getNombre());
			}
			// 2.Enviar colección de salas a la vista
			request.setAttribute("mapaSalas", mapaSalas);
			System.out.println("reenviando a index.jsp?sec=salas");
			request.getRequestDispatcher("index.jsp?sec=salas").forward(request, response);

		} catch (Throwable e) {
			e.printStackTrace();
		}

	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			BilboSKP.cargarSalasFisicas();
			BilboSKP.cargarSalasOnline();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
	}
}
