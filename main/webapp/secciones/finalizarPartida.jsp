<%@ page
	import="java.util.Vector, java.util.HashMap, java.util.Enumeration, java.util.Map, model.Flecha,java.util.Date, model.Escenario, 
	model.Sala, model.SalaOnline,model.MensajeChat, java.net.URLEncoder, model.Invitado,model.Anfitrion,model.Jugador,view.StringHelper,view.DateHelper,view.Icon,model.PartidaOnline,model.Suscriptor"%>
<%  
//obtener datos del request/sesion
PartidaOnline partidaOnline = (PartidaOnline) request.getAttribute("partidaOnline");
System.out.println(partidaOnline.getTiempoMinutos());
if(partidaOnline == null){
	response.sendRedirect("./salas");
}

String stringtiempo = "";
if(partidaOnline.getTiempoMinutos() == 0){
	stringtiempo = partidaOnline.calcularTiempoSegundos() + " segundos";
} else {
	stringtiempo = partidaOnline.getTiempoMinutos() +" minutos y "+partidaOnline.calcularTiempoSegundos();
}
%>
<link rel="stylesheet" href="css/estilosFinalizarPartida.css">
<div id="fondoFinalizarPartida">
	<section class="principal">
		<div id="caja_principal">
			<h1 class="bilbosk_h1">Habeis finalizado "<%=partidaOnline.getSala().getNombre()%>"</h1>
			<p class="bilboskp_p">Anfitrión: <%=partidaOnline.getAnfitrion().getAlias()%></p>
			<p class="bilboskp_p">Tiempo de finalización: <%=stringtiempo%></p>
			<p class="bilboskp_p">Puntuacion total: <%=partidaOnline.getPuntaje()%> </p>
			<p class="bilboskp_p">Pistas usadas: Habeis usado <%=partidaOnline.getVectorpistasUtilizadas().size()%> pistas</p>
		</div>
		<div id="Botones">
			<div class="flex_center">
				<a class="flex_center"  href="./salas">
				<button class="bilboskp_icon_button" id="SalaBoton">Ver salas</button></a> 
				<a class="flex_center"  href="./ranking?sala=SO<%=partidaOnline.getSala().getIdSala()%>">
				<button id="RankingBoton" class="bilboskp_icon_button">Ver ranking</button></a>
			</div>
		</div>
	</section>
</div>