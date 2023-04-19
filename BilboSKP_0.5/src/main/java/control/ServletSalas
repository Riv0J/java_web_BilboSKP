package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import model.SalaOnline;
import view.Mensaje;

@WebServlet("/salas")
public class ServletSalas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// 1.Contactar con el modelo para obtener los datos necesarios
			Vector<SalaOnline> vectorSalas = BilboSKP.getSalasOnline();
			
			// 2.Enviar colección de gatos a la vista (index?sec=galeria)
			System.out.println("reenviando a index.jsp?sec=salas");
			for (SalaOnline salaOnline : vectorSalas) {
				System.out.println(salaOnline.getNombre());
			}
			request.setAttribute("vectorSalas", vectorSalas);
			request.getRequestDispatcher("index.jsp?sec=salas").forward(request, response);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}

}
