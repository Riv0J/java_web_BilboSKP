package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Suscriptor;

@WebServlet("/logout")
public class ServletLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Dopost en Logout");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession sesion = (req.getSession());
		Object sus = (Object) sesion.getAttribute("suscriptor");
		// ver si habia una url previa dentro de la sesion
		Object urlPrevia = (Object) sesion.getAttribute("urlPrevia");

		if (sus instanceof Suscriptor) {
			sesion.removeAttribute("suscriptor");
		}
		try {
			if (urlPrevia instanceof String) {
				System.out.println("ServletLogout: habia una url previa: "+urlPrevia);
				response.sendRedirect((String) urlPrevia);
			} else {
				System.out.println("ServletLogout: NO url previa establecida = "+urlPrevia);
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
