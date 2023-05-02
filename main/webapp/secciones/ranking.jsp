<%@page import="control.BilboSKP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.util.HashMap,java.util.ArrayList,java.util.Map, java.util.Vector, java.text.SimpleDateFormat, model.Sala, model.PartidaOnline, model.Partida"%>
<%
HashMap<String, Sala> salasAMostrar = (HashMap<String, Sala>) request.getAttribute("salasAMostrar"); //hashmap de salas Online cargadas
Sala salaSeleccionada = (Sala) request.getAttribute("salaSeleccionada"); //una sala
Vector<PartidaOnline> partidas = (Vector<PartidaOnline>) request.getAttribute("partidas");
System.out.println(salaSeleccionada.getNombre());
System.out.print(salasAMostrar.size());
// verificar que hay partidas / vector de partidas
for (PartidaOnline partida : partidas) {
	Sala salapartida = partida.getSala();
	String nombregrupo = partida.getNombreGrupo();
	String puntos = Integer.toString(partida.getPuntaje());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String fecha = sdf.format(partida.getFechaInicio());
	System.out.println(nombregrupo);

	//necesito un array de todas las salas/ un array de todas las partidas de esa sala/

	//String salaseleccionada = request.getParameter("salaseleccionada");

}
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
			<li><a href="ranking&sala=<%=salas.getKey()%>"> <%=salas.getValue().getNombre()%>
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
					
				</p>
			</div>
		</div>
		<div class="info">
			<img src="./img_web/icons/copa1.png">
			<div class="caja oro">
				<p>
					
				</p>
			</div>
		</div>
		<div class="info">
			<img src="./img_web/icons/copa3.png">
			<div class="caja bronce">
				<p>
					
				</p>
			</div>
		</div>
	</div>
	<div id="finalistas">
		<ol>
			<li value="4"></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		 
	<%
	for (int i = 0; i < partidas.size(); i++) {
		PartidaOnline partida = (PartidaOnline) partidas.get(i);
	%>
	<div id="podio">
		<div class="info">
			<img src="../img_web/icons/copa2.png">
			<div class="caja plata">
				<p>
					<%
					if (i == 1) {
					%>
					<%=partida.getNombreGrupo()%>
					<br>
					<%=partida.getPuntaje()%><br><%=partida.calcularTiempo()%>
					<%
					}
					%>
				</p>
			</div>
		</div>
		<div class="info">
			<img src="../img_web/icons/copa1.png">
			<div class="caja oro">
				<p>
					<%
					if (i == 0) {
					%>
					<%=partida.getNombreGrupo()%>
					<br>
					<%=partida.getPuntaje()%><br><%=partida.calcularTiempo()%>
					<%
					}
					%>
				</p>
			</div>
		</div>
		<div class="info">
			<img src="../img_web/icons/copa3.png">
			<div class="caja bronce">
				<p>
					<%
					if (i == 2) {
					%>
					<%=partida.getNombreGrupo()%>
					<br>
					<%=partida.getPuntaje()%><br><%=partida.calcularTiempo()%>
					<%
					}
					%>
				</p>
			</div>
		</div>
	</div>
	<div id="finalistas">
		<ol>
			<li value="4">
				<%
				if (i == 3) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 4) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 5) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 6) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 7) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 8) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
			<li>
				<%
				if (i == 9) {
				%> <%=partida.getNombreGrupo()%> <%=partida.getPuntaje()%><%=partida.calcularTiempo()%>
				<%
				}
				%>
			</li>
		</ol>
	</div>
	<%
	if (i >= 9) {
		break;
	}

	}
	%>



	<style>
.info {
	width: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

img {
	width: 80px;
	height: 80px;
}

p {
	width: 100%;
	text-align: center;
}

.superior {
	width: 80%;
	height: 2em;
	margin-right: 5%;
	float: right;
	display: flex;
	justify-content: center;
	/*border: #000 solid 1px;*/
}

.lateral {
	width: 16%;
	height: 500px;
	float: left;
	margin-left: 3%;
	margin-top: 4%;
	/*border: #000 solid 1px;*/
}

#podio {
	position: static;
	display: flex;
	/*  align-content: center;*/
	top:-20;
	align-items: flex-end;
	width: 65%;
	height: 22em;
	margin-left: 25%;
	/*border: #000 solid 1px;*/
}

.oro {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 3px solid #ffd700;
	height: 10em;
	width: 10em;
	/*padding: 0 auto;*/
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	font-size: x-large;
	font-weight: 700;
	background-color: #F5DF68;
}

.plata {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 3px solid #C0C0C0;
	height: 10em;
	width: 10em;
	margin: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	font-size: large;
	font-weight: 600;
	background-color: #D8D8D8;
}

.bronce {
	display: flex;
	justify-content: center;
	align-items: center;
	border: 3px solid #8F5732;
	height: 8em;
	width: 10em;
	margin: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	font-size: large;
	font-weight: 500;
	background-color: #C68358;
}

#finalistas {
	margin-left: 20%;
	/*border: #000 solid 1px;*/
}

li {
	margin: 1px;
	/*border: #000 solid 1px;*/
}
</style>
</body>


