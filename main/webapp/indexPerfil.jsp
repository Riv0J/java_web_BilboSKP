<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String seccion = request.getParameter("sec");
String rutaJspSeccion = "";
if (seccion == null) {
	seccion = "perfil";
}
rutaJspSeccion = "secciones/" + seccion + ".jsp";
%>
<link rel="stylesheet" href="/css/perfil.css">
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
            
</section>     
<main>
		<%-- <jsp:include page="plantillas/mensaje.jsp"></jsp:include>--%>
		<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
</main>


