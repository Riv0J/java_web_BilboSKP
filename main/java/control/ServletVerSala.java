package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Sala;
import model.SalaFisica;

@WebServlet({"/verSala","/reservar<das/*"})
public class ServletVerSala extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletVerSala() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doget verSala");
		String idSala = request.getParameter("idSala");
		if (idSala!=null) {
			Sala salaAMostrar = Sala.getSalaPorId(idSala);
			if (salaAMostrar!=null) {
				//determinar si la sala es fisica
				boolean esSalaFisica = false;
				if (salaAMostrar instanceof SalaFisica) {
					esSalaFisica = true;
				}
				//poner atributos del request, para que la seccion pueda mostrar la info
				request.setAttribute("salaAMostrar", salaAMostrar);
				request.setAttribute("esSalaFisica", esSalaFisica);
				System.out.println("Ver la sala: "+salaAMostrar.getNombre());
				//enviar al cliente a la seccion con id sala
				request.getRequestDispatcher("./index.jsp?sec=verSala&idSala="+idSala).forward(request, response);
			}
		} 
		//si no se encuentra el id de la sala que el usuario quierr ver, se le manda a ver todas las salas
		response.sendRedirect("./salas?buscar=todas&m=todas&t=todas&d=todas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
