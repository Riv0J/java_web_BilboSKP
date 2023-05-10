<%@ page 
	import="java.util.Vector, java.util.HashMap, java.util.Map, java.util.Locale,java.util.Date, java.time.LocalDate, java.io.File, java.text.Normalizer, 
	model.Suscriptor, model.Reserva,model.Cupon, model.Sala, model.SalaOnline, model.SalaFisica, model.Horario,view.StringHelper, view.DateHelper, view.Icon,view.Traductor,view.CookieHelper"%>
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
String subseccion = request.getParameter("sub");
if (subseccion == null)  {
	response.sendRedirect("./perfil");
}
String rutaJspSeccion = "subsecciones/" + subseccion + ".jsp";
//System.out.println(rutaJspSeccion);
%>

<link rel="stylesheet" href="css/perfil.css">

<div id="caja0">
            <div class="cajaPerfil">
            	<h1><%=Traductor.get(leng, "PE1")%></h1>
                <ul>
                    <li class="gc"><a href="./perfil?sub=gestionCuenta" style="color:#fff"><%=Traductor.get(leng, "PE2")%></a></li>
                    <li><a href="./perfil?sub=reserva" style="color:#fff"><%=Traductor.get(leng, "PE3")%> </a></li>
                    <li><a href="./perfil?sub=cupones" style="color:#fff"><%=Traductor.get(leng, "PE4")%></a></li>
	                <li><a href="./logout" style="color:#fff"><%=Traductor.get(leng, "PE5")%></a></li>
                </ul>
            </div>
            <div class="cajaSubseccion">
            	<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
            </div>
</div>



		


