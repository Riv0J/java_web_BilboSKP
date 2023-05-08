package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cupon;
import model.Suscriptor;
import view.Mensaje;

/**
 * Servlet implementation class ServletTienda
 */
@WebServlet("/tienda")
public class ServletTienda extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Doget tienda");

		// redireccionamiento: establecer la url a mandar como url previa en la sesion
		String urlPrevia = "./tienda";
		System.out.println("ServletTienda urlprevia establecida = " + urlPrevia);
		HttpSession sesion = request.getSession();
		sesion.setAttribute("urlPrevia", urlPrevia);
		// ---------------------------------------------------------------------------//

		Suscriptor sus = (Suscriptor) sesion.getAttribute("suscriptor");

		String accion = request.getParameter("accion");
		System.out.println(accion);
		int cantidadComprar = Integer.parseInt(request.getParameter("cantidad"));
		System.out.println(cantidadComprar);

		if (accion == null) {
			accion = "comprar";
		}
		switch (accion) {
		case "comprar":
			// comprobar si se está suscrito
			if (sus != null) {
				// los cupones comprados irán a la cuenta de sus
				int susID = sus.getIdSuscriptor();
				try {
					for (int i = 0; cantidadComprar > i; i++) {
						BilboSKP.otorgarCupon(Cupon.CUPON_REGULAR, susID);
						System.out.println("1 cupon regular comprado");
					}
					Mensaje mensaje = new Mensaje("Has comprado "+cantidadComprar+" cupones", Mensaje.MENSAJE_EXITO);
					sesion.setAttribute("mensaje", mensaje);
				} catch (Throwable e) {
					System.out.println("1 cupon regular NO comprado");
					e.printStackTrace();
				}
			} else {
				// ofrecer registro
				System.out.println("suscribirte?");
				request.getRequestDispatcher("/subscribe").forward(request, response);
				;
			}
			break;

		case "regalar":
			// comprobar si se está suscrito
			if (sus != null) {
				// pedir datos del suscriptor del sus a regalar(susReg) (alias+correo)
				String susEmail = request.getParameter("email");
				int cantidad = Integer.parseInt(request.getParameter("cantidad"));
				// Suscriptor susReg =BilboSKP.comprobarSuscriptor(susAlias, susEmail);
				// comprobar si susReg existe
				try {
					Suscriptor susReg = BilboSKP.comprobarSuscriptor(susEmail);
					System.out.println("suscriptor existe");
				} catch (Throwable e) {
					System.out.println("suscriptor no existe");
					e.printStackTrace();
				}
				// pagar(¿xD?)
				// enviar cupones a susReg
				Suscriptor susReg = null;
				int susRegID = susReg.getIdSuscriptor();
				try {
					for (int i = 0; cantidad > i; i++) {

						BilboSKP.otorgarCupon(Cupon.CUPON_REGULAR, susRegID);
						System.out.println("Se envió el cupon con exito");
						Mensaje mensaje = new Mensaje("Has regalado "+cantidad+" cupones al suscriptor con email "+susEmail+"", Mensaje.MENSAJE_EXITO);

					}
				} catch (Throwable e) {
					System.out.println("No se pudo enviar el cupon");
					e.printStackTrace();
				}
			} else {
				// ofrecer registro
				System.out.println("suscribirte?");
				request.getRequestDispatcher("/index.jsp?sec=subscribe").forward(request, response);
				;
			}

			break;
		}

	}

}
