<%@page import="control.BilboSKP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.HashMap,java.util.ArrayList,java.util.Map, java.util.Vector, java.text.SimpleDateFormat, model.Sala, model.PartidaOnline, model.Partida, view.BilboskpColor"%>


<%
HashMap<String, Sala> salasAMostrar = (HashMap<String, Sala>) request.getAttribute("salasAMostrar"); //hashmap de salas Online cargadas
Sala salaSeleccionada = (Sala) request.getAttribute("salaSeleccionada"); //una sala
Vector<PartidaOnline> partidas = (Vector<PartidaOnline>) request.getAttribute("partidas");



// verificar que hay partidas / vector de partidas
Vector<PartidaOnline> finalistas = new Vector<PartidaOnline>();
//necesito un array de todas las salas/ un array de todas las partidas de esa sala/
		for (PartidaOnline partidaOnline : partidas) {
			//System.out.println(partidaOnline.getPuntaje());
			
		}
//String salaseleccionada = request.getParameter("salaseleccionada");
%>

<body id="ranking">
	<link rel="stylesheet" href="css/ranking.css">

	<h2 class="superior">
		Sala de escape:
		<%=salaSeleccionada.getNombre()%>
	</h2>
	<nav class="lateral">
		<%--recorrer salas hasta que no haya mas --%>
		<ul>
			<%
			for (Map.Entry<String, Sala> salas : salasAMostrar.entrySet()) {
			%>
			<li><a href="./ranking?sala=<%=salas.getKey()%>"
				style="color: #fff;"> <%=salas.getValue().getNombre()%>
			</a></li>
			<%
			}
			%>
		</ul>


	</nav>

	<%--//consulta sql query ,    
	//for (PartidaOnline partida:partidas) {
		//Sala sala =partida.getSala();
		//String nombregrupo = partida.getNombreGrupo();
		//String puntos=Integer.toString(partida.getPuntaje());
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//String fecha = sdf.format(partida.getFechaInicio());
		//int contador= 1;
		 --%>
	<div id="finalistas">
		<ol>
			<% for(int i = 0; i<partidas.size(); i++){
				PartidaOnline partida = partidas.get(i); 
				System.out.println(partidas.size());
				double animation_duration = (0.15*i)+0.2;
				%>
				<li class="caja_linea_ranking" style="animation-delay: <%=animation_duration%>s; background-color: <%=BilboskpColor.obtenerColorDegradado(i)%>;"> 
					<div><%="#"+(i+1)%></div>
					<div><img src="img_suscriptores/<%=partida.getAnfitrion().getImagen()%>"></div>
					<div><%=partida.getAnfitrion().getAlias()%></div>
					<div><%=partida.getPuntaje()%> puntos</div>
					<div><%=partida.getTiempoMinutos()%> mins</div>
				</li>
			<%}%>
		</ol>
	</div>
</body>