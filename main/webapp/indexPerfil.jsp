<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String subseccion = request.getParameter("sub");
String rutaJspSeccion = "";
if (subseccion == null) {
	subseccion = "gestionCuenta";
}
rutaJspSeccion = "subsecciones/" + subseccion + ".jsp";
%>
<link rel="stylesheet" href="css/perfil.css">
<link rel="stylesheet" href="css/gestionCuenta.css">

<section>
            <div class="caja1">
                <h1>Mi perfil</h1>
                <ul>
                    <li class="gc"><a href="perfil.jsp">Gestión de la cuenta</a></li>
                    <li><a href="misReservas.jsp">Mis reservas</a></li>
                    <li><a href="cupones.jsp">Mis cupones</a></li>
                    <li><a href="ajustesCuenta.html">Cerrar sesión</a></li>
                </ul>
            </div> 
            
        <div class="caja2">
        <%-- <jsp:include page="plantillas/mensaje.jsp"></jsp:include>--%>
		<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
        </div>         
</section>     

		


