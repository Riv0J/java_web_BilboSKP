<%@page import="control.BilboSKP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.HashMap,java.util.ArrayList,java.util.Map, java.util.Vector, java.text.SimpleDateFormat, model.Sala, model.PartidaOnline, model.Partida"%>

<link rel="stylesheet" href="css/ranking.css">

<%
HashMap<String, Sala> salasAMostrar = (HashMap<String, Sala>) request.getAttribute("salasAMostrar"); //hashmap de salas Online cargadas
Sala salaSeleccionada = (Sala) request.getAttribute("salaSeleccionada"); //una sala
Vector<PartidaOnline> partidas = (Vector<PartidaOnline>) request.getAttribute("partidas");
System.out.println(salaSeleccionada.getNombre());
System.out.println(salasAMostrar.size());
// verificar que hay partidas / vector de partidas


	//necesito un array de todas las salas/ un array de todas las partidas de esa sala/

	//String salaseleccionada = request.getParameter("salaseleccionada");


%>

<body>
	<h2 class="superior">
		Sala de escape:<%=salaSeleccionada.getNombre()%>
	</h2>
	<nav class="lateral">
		<%--recorrer salas hasta que no haya mas --%>
		<ul>
			<%
			for (Map.Entry<String, Sala> salas : salasAMostrar.entrySet()) {
			%>
			<li><a href="index.jsp?sec=ranking&sala=<%=salas.getKey()%>"> <%=salas.getValue().getNombre()%>
			</a></li>
			<br>
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
		<div class="info">
			<img src="./img_web/icons/copa2.png">
			<div class="caja plata">
				<p>
					<%
					String posicion2nombre = new String();
					%><br>
					<%
					String posicion2puntos = new String();
					%><br>
					<%
					String posicion2tiempo = new String();
					%>
				</p>
			</div>
		</div>
		<div class="info">
			<img src="./img_web/icons/copa1.png">
			<div class="caja oro">
				<p>
					<%
					String posicion1nombre = new String();
					%><br>
					<%
					String posicion1puntos = new String();
					%><br>
					<%
					String posicion1tiempo = new String();
					%>
				</p>
			</div>
		</div>
		<div class="info">
			<img src="./img_web/icons/copa3.png">
			<div class="caja bronce">
				<p>
				<%
					String posicion3nombre = new String();
					%><br>
					<%
					String posicion3puntos = new String();
					%><br>
					<%
					String posicion3tiempo = new String();
					%></p>
			</div>
		</div>
	</div>
	<div id="finalistas">
		<ol>
			<li value="4"><%
					String posicion4nombre = new String();
					String posicion4puntos = new String();
					String posicion4tiempo = new String();
					%></li>
			<li><%
					String posicion5nombre = new String();
					String posicion5puntos = new String();
					String posicion5tiempo = new String();
					%></li>
			<li><%
					String posicion6nombre = new String();
					String posicion6puntos = new String();
					String posicion6tiempo = new String();
					%></li>
			<li><%
					String posicion7nombre = new String();
					String posicion7puntos = new String();
					String posicion7tiempo = new String();
					%></li>
			
			<li><%
					String posicion8nombre = new String();
					String posicion8puntos = new String();
					String posicion8tiempo = new String();
					%></li>
			<li><%
					String posicion9nombre = new String();
					String posicion9puntos = new String();
					String posicion9tiempo = new String();
					%></li>
			<li><%
					String posicion10nombre = new String();
					String posicion10puntos = new String();
					String posicion10tiempo = new String();
					%></li>
		</ol>
	</div>
			<%for (int i = 0; i < partidas.size(); i++) {
				PartidaOnline partida = (PartidaOnline) partidas.get(i);
			
			if (i == 0) {
System.out.println("prueba1");
				posicion1nombre = partida.getNombreGrupo();
				posicion1puntos = Integer.toString(partida.getPuntaje());
				posicion1tiempo = Integer.toString(partida.calcularTiempo());
			}
			
			if (i == 1) {

				posicion2nombre = partida.getNombreGrupo();
				posicion2puntos = Integer.toString(partida.getPuntaje());
				posicion2tiempo = Integer.toString(partida.calcularTiempo());
			}
			
	if (i == 2) {
	}
		posicion3nombre = partida.getNombreGrupo();
		posicion3puntos = Integer.toString(partida.getPuntaje());
		posicion3tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 3) {
		posicion4nombre = partida.getNombreGrupo();
		posicion4puntos = Integer.toString(partida.getPuntaje());
		posicion4tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 4) {
		posicion5nombre = partida.getNombreGrupo();
		posicion5puntos = Integer.toString(partida.getPuntaje());
		posicion5tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 5) {
		posicion6nombre = partida.getNombreGrupo();
		posicion6puntos = Integer.toString(partida.getPuntaje());
		posicion6tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 6) {
		posicion7nombre = partida.getNombreGrupo();
		posicion7puntos = Integer.toString(partida.getPuntaje());
		posicion7tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 7) {
		posicion8nombre = partida.getNombreGrupo();
		posicion8puntos = Integer.toString(partida.getPuntaje());
		posicion8tiempo = Integer.toString(partida.calcularTiempo());
	}
	if (i == 8) {
		posicion9nombre = partida.getNombreGrupo();
		posicion9puntos = Integer.toString(partida.getPuntaje());
		posicion9tiempo = Integer.toString(partida.calcularTiempo());
	}
	
	if (i >= 9) {
		break;
	}

	
	}
	
	
	%>
</body>