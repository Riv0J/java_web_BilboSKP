package control;

import java.io.IOException;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SalaOnline;

/**
 * Servlet implementation class ServletInicio
 */
@WebServlet(
		urlPatterns = { "/index.jsp12313" }, 
		initParams = { 
				@WebInitParam(name = "font-title", value = "Verdana", description = "fuente de titulo")
		})
public class ServletInicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletInicio() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
