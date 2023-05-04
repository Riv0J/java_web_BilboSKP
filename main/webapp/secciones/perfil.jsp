<%@ page 
	import="java.util.Vector, java.util.HashMap, java.util.Map, java.util.Locale,java.util.Date, java.time.LocalDate, java.io.File, java.text.Normalizer, 
	model.Suscriptor, model.Reserva,model.Cupon, model.Sala, model.SalaOnline, model.SalaFisica, model.Horario,view.StringHelper, view.DateHelper, view.Icon"%>
<%
String subseccion = request.getParameter("sub");
if (subseccion == null)  {
	response.sendRedirect("./perfil");
}
String rutaJspSeccion = "subsecciones/" + subseccion + ".jsp";
System.out.println(rutaJspSeccion);
%>

<link rel="stylesheet" href="css/perfil.css">

<div id="caja0">
            <div class="cajaPerfil">
            	<h1>Mi perfil</h1>
                <ul>
                    <li class="gc"><a href="./perfil?sub=gestionCuenta">Gestión de la cuenta</a></li>
                    <li><a href="./perfil?sub=reserva">Mis reservas</a></li>
                    <li><a href="./perfil?sub=cupones">Mis cupones</a></li>
	                <li><a href="./logout">Cerrar sesión</a></li>
                </ul>
            </div>
            <div class="cajaSubseccion">
            	<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
            </div>
</div>



		


