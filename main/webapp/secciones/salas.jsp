<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica"%>
<%
HashMap<String, Sala> mapaSalas = (HashMap<String, Sala>) request.getAttribute("mapaSalas");
ArrayList<String> tematicasDisponibles = (ArrayList<String>) request.getAttribute("tematicasDisponibles");
ArrayList<String> dificultadesDisponibles = (ArrayList<String>) request.getAttribute("dificultadesDisponibles");

String m = request.getParameter("m");
String d = request.getParameter("d");
String t = request.getParameter("t");
String paramBuscar = request.getParameter("buscar");
%>

<link rel="stylesheet" href="css/salas.css">
<%
if (dificultadesDisponibles != null && tematicasDisponibles != null) {
%>

<section id="contenedor_buscador">
	<form>
		<div id="wrapper_buscador">
			<div id="caja_buscador">
				<img alt="" src="img_web/iconos_salas/Lupa.svg"> <input
					type="text" id="buscar" name="buscar" value="<%=paramBuscar%>"
					placeholder="Buscar salas de escape por nombre">
			</div>
		</div>
		<div id="wrapper_filtros">
			<div id="caja_filtros">
				<select id="m" name="m">
					<option <%if (m.equals("todas")) {%> selected <%}%> value="todas">Todas las modalidades</option>
					<option <%if (m.equals("online")) {%> selected <%}%> value="online">Salas Online</option>
					<option <%if (m.equals("fisicas")) {%> selected <%}%> value="fisicas">Salas Físicas</option>
				</select> <select id="tematica" name="t">
					<option value="todas">Todas las temáticas</option>
					<%
					for (String tematica : tematicasDisponibles) {
						String tematicaNormalizada = Normalizer.normalize(tematica, Normalizer.Form.NFD)
	                            .replaceAll("[^\\p{ASCII}]", "")
	                            .toLowerCase();
					%>
					<option <%if (t.equals(tematicaNormalizada)) {%> selected <%}%> value="<%=tematicaNormalizada%>"><%=tematica%></option>

					<%
					}
					%>

				</select> <select id="d" name="d">
					<option value="todas">Todas las dificultades</option>
					<%
					for (String dificultad : dificultadesDisponibles) {
						String dificultadNormalizada = Normalizer.normalize(dificultad, Normalizer.Form.NFD)
	                            .replaceAll("[^\\p{ASCII}]", "")
	                            .toLowerCase();
					%>
					<option <%if (d.equals(dificultadNormalizada)) {%> selected <%}%> value="<%=dificultadNormalizada%>"><%=dificultad%></option>
					<%
					}
					%>
				</select>
			</div>
		</div>
	</form>
</section>
<%
}
%>
<section id="caja_titulo_resultados">
	<h2>Mostrando <%=mapaSalas.size()%> resultados de la búsqueda: "<%=paramBuscar%>"</h2>
</section>
<section id="contenedor_salas">

	<div id=contenedor_salas_wrapper>
		<%
		if (mapaSalas == null || mapaSalas.size() == 0) {
		%>
		<article class="caja_sala">
			<div class="caja_img">
				<img src="img_salas/portadas/1.png" alt="Imagen de la sala">
			</div>
			<div class="caja_titulo">
				<h2>No se encontraron salas, por favor inténtalo de nuevo</h2>
			</div>
			<div class="caja_organizar">
				<button>
					<a href=""./salas?buscar=todas&m=todas&t=todas&d=todas"">Reintentar</a>
				</button>
			</div>
		</article>
		<%
		} else {
		for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			Sala sala = par.getValue();
			String idSala = par.getKey();
			String nombreSala = sala.getNombre();
			String textoBoton = "Organizar partida";
			String enlaceBoton = "./organizar?id=" + idSala;
			String modalidad = "Online";
			String classTematicaLarga = "";
			if (sala instanceof SalaFisica) {
				textoBoton = "Realizar Reserva";
				enlaceBoton = "./reservar?id=" + idSala;
				modalidad = "Reserva";

			}
			if (sala.getTematica().equals("Suspenso")) {
				classTematicaLarga = "tematica_larga";
			}
		%>
		<article class="caja_sala">
			<div class="caja_img">
				<img src="img_salas/portadas/<%=par.getKey()%>.png" alt="Portada">
			</div>
			<div class="caja_titulo">
				<h2><%=nombreSala%></h2>
			</div>
			<div class="caja_sinopsis">
				<p><%=sala.getDescripcion()%></p>
			</div>
			<div class="caja_etiquetas">
				<div class="etiqueta jugadores">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/User.svg"
							alt="Jugadores:">
					</div>

					<div class="caja_text"><%=sala.getJugadoresMin()%>-<%=sala.getJugadoresMax()%></div>
				</div>
				<div class="etiqueta dificultad">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/Lock.svg"
							alt="Dificultad:">
					</div>

					<div class="caja_text"><%=sala.getDificultad()%></div>
				</div>
				<div class="etiqueta tiempo">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/Clock.svg"
							alt="Tiempo:">
					</div>

					<div class="caja_text"><%=sala.getTiempoMax()%>'
					</div>
				</div>

				<div class="etiqueta tematica <%=classTematicaLarga%>">
					<div class="caja_icon">
						<img class="icon"
							src="img_web/iconos_salas/<%=sala.getTematica()%>.svg"
							alt="Tematica:">
					</div>

					<div class="caja_text"><%=sala.getTematica()%></div>
				</div>
				<div class="etiqueta modalidad">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/<%=modalidad%>.svg"
							alt="Modo">
					</div>

					<div class="caja_text"><%=modalidad%></div>
				</div>
			</div>
			<div class="caja_organizar">
				<button>
					<a href=<%=enlaceBoton%>>Ver más</a>
				</button>
			</div>
		</article>

		<%
		}
		}
		%>
	
</section>