package control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Jugador;
import model.PartidaOnline;
import model.SalaOnline;
import model.Suscriptor;

@WebFilter("/jugar")
public class FilterJuego implements Filter {

    public FilterJuego() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession sesion = ((HttpServletRequest) request).getSession();
		Object jugador = sesion.getAttribute("jugador");
		if(jugador instanceof Jugador) {
			chain.doFilter(request, response);
		} else {
			System.out.println("FilterJuego: Redireccionando al index, no se ha encontrado jugador");
			/*intentar inyectar datos de prueba(BORRAR UNA FEZ FUNCIONE
			Suscriptor sus = new Suscriptor(500, 1, "admin", "FilterLogin", "f", "f", "defaults/1.png", 1, new Date());
			PartidaOnline po = new PartidaOnline(SalaOnline.getSalaPorId(1),sus,sesion,8,"nombregrupo");
			int codInvitacion = po.getCodInvitacion();
			request.setAttribute("codInvitacion", ""+codInvitacion);
			request.setAttribute("partidaOnline", po);
			sesion.setAttribute("jugador", new Jugador());
			sesion.setAttribute("suscriptor", sus);
			sesion.setAttribute("ADMIN", "ADMIN");
			chain.doFilter(request, response);*/
			((HttpServletRequest)request).getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		BilboSKP.cargarInfoSalas();
		
	}

}
