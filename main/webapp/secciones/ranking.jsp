<%@page import="control.BilboSKP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.HashMap,java.util.ArrayList,java.util.Map, java.util.Vector, java.text.SimpleDateFormat, model.Sala, model.PartidaOnline, model.Partida"%>


<%
HashMap<String, Sala> salasAMostrar = (HashMap<String, Sala>) request.getAttribute("salasAMostrar"); //hashmap de salas Online cargadas
Sala salaSeleccionada = (Sala) request.getAttribute("salaSeleccionada"); //una sala
Vector<PartidaOnline> partidas = (Vector<PartidaOnline>) request.getAttribute("partidas");
Vector<PartidaOnline> partidasFinalistas = new Vector<PartidaOnline>();

// verificar que hay partidas / vector de partidas
Vector<PartidaOnline> finalistas = new Vector<PartidaOnline>();
//necesito un array de todas las salas/ un array de todas las partidas de esa sala/

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

	<div id="podio">
		<%for (int i = 0; i < partidas.size(); i++) {
			PartidaOnline partida = (PartidaOnline) partidas.get(i);
		if (i == 1) {%>
		<div class="info" id="plata">
			<img src="./img_web/icons/copa2.png">
			<div class="caja plata">
				<p><%=partida.getNombreGrupo()%><br>
					<%=partida.getPuntaje()%>
					puntos<br>
					<%=partida.getTiempoMinutos()%>
					mins
				</p>
			</div>
		</div>
		<%} else if (i == 0) {%>
		<div class="info" id="oro">
			<img src="./img_web/icons/copa1.png">
			<div class="caja oro">
				<p><%=partida.getNombreGrupo()%><br>
					<%=partida.getPuntaje()%>
					puntos<br>
					<%=partida.getTiempoMinutos()%>
					mins
				</p>
			</div>
		</div>
		<%} else if  (i == 2) {%>
		<div class="info" id="bronce">
			<img src="./img_web/icons/copa3.png">
			<div class="caja bronce">
				<p><%=partida.getNombreGrupo()%><br>
					<%=partida.getPuntaje()%>
					puntos<br>
					<%=partida.getTiempoMinutos()%>
					mins
				</p>
			</div>
		</div>
		<%} else {
			partidasFinalistas.add(partidas.get(i));
		} %>
	<%}%>
	</div>
	<div id="finalistas">
		<ol>
			<% for(int i = 0; i<partidasFinalistas.size(); i++){
				PartidaOnline partidaFinalista = partidasFinalistas.get(i); 
				%>
				<li> 
				<div><%=i+4%></div>
				<div><%=partidaFinalista.getNombreGrupo()%></div>
				<div><%=partidaFinalista.getPuntaje()%> puntos</div>
				<div><%=partidaFinalista.getTiempoMinutos()%> mins</div>
				</li>
			<%}%>
		</ol>
	</div>
</body>