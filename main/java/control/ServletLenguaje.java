package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import view.CookieHelper;

@WebServlet("/lenguaje")
public class ServletLenguaje extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletLenguaje() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String lenguaje = request.getParameter("lenguaje");

		if (lenguaje == null) {
			lenguaje = CookieHelper.DEFAULT_LENGUAJE;
		}
		if (CookieHelper.lenguajeDisponible(lenguaje) == true) {
			Cookie cookie = new Cookie(CookieHelper.LENGUAJE_COOKIE_NAME, lenguaje);
			cookie.setMaxAge(3600 * 24 * 365); // 1 año de duración
			cookie.setPath("/");
			response.addCookie(cookie);

		} else {
			System.out.println("ESE LENGUAJE NO ESTÁ DISPONIBLE " + lenguaje);
		}
		// redireccionamiento
		HttpSession sesion = request.getSession();
		System.out.println("El objeto Suscriptor no existe en la sesión");
		try {
			String urlPrevia = (String) sesion.getAttribute("urlPrevia");
			if (urlPrevia instanceof String) {
				System.out.println("ServletLogin: habia una url previa: " + urlPrevia);
				((HttpServletResponse) response).sendRedirect((String) urlPrevia);
			} else {
				System.out.println("ServletLogin: NO url previa establecida = " + urlPrevia);
				((HttpServletResponse) response).sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			((HttpServletResponse) response).sendRedirect("index.jsp");
		}
	}
}
