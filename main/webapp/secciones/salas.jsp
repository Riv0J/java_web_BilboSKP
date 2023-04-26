<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Sala, view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig, view.NormalizeHelper"%>
<%
HashMap<String, Sala> mapaSalas = (HashMap<String, Sala>) request.getAttribute("mapaSalas");
ArrayList<String> tematicasDisponibles = (ArrayList<String>) request.getAttribute("tematicasDisponibles");
ArrayList<String> dificultadesDisponibles = (ArrayList<String>) request.getAttribute("dificultadesDisponibles");
HashMap<String, String> mapaAppConfig = (HashMap<String, String>) request.getAttribute("appConfig");

String m = request.getParameter("m");
String d = request.getParameter("d");
String t = request.getParameter("t");
String paramBuscar = request.getParameter("buscar");

if (mapaAppConfig == null) {
	mapaAppConfig = AppConfig.getMapaConfig();
}
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
					placeholder="<%=Frases.getFrase("ESSalasBuscar") %>">
			</div>
		</div>
		<div id="wrapper_filtros">
			<div id="caja_filtros">
				<jsp:include page="../plantillas/desplegableFiltroSalas.jsp"></jsp:include>
				<select name="m">
					<option <%if (m.equals("todas")) {%> selected <%}%> value="todas"><%=Frases.getFrase("ESSalasModalidades")%></option>

					<option <%if (m.equals("online")) {%> selected <%}%> value="online"><%=Frases.getFrase("ESSalasOnline")%></option>
					<option <%if (m.equals("fisicas")) {%> selected <%}%>
						value="fisicas"><%=Frases.getFrase("ESSalasFisicas")%></option>
				</select> <select name="t">
					<option value="todas"><%=Frases.getFrase("ESSalasTematicas")%></option>
					<%
					for (String tematica : tematicasDisponibles) {
						String tematicaNormalizada = NormalizeHelper.normalizarTexto(tematica);
					%>
					<option <%if (t.equals(tematicaNormalizada)) {%> selected <%}%>
						value="<%=tematicaNormalizada%>"><%=tematica%></option>

					<%
					}
					%>

				</select> <select name="d">
					<option value="todas"><%=Frases.getFrase("ESSalasDificultad")%></option>
					<%
					for (String dificultad : dificultadesDisponibles) {
						String dificultadNormalizada = NormalizeHelper.normalizarTexto(dificultad);
					%>
					<option <%if (d.equals(dificultadNormalizada)) {%> selected <%}%>
						value="<%=dificultadNormalizada%>"><%=dificultad%></option>
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
int numeroResultados = 0;
if (mapaSalas != null) {
numeroResultados = mapaSalas.size();
}
%>
<section id="caja_titulo_resultados">
	<h2>
		<%=Frases.getFrase("ESSalasResultado")%> <%=numeroResultados%>	<%=Frases.getFrase("ESSalasResultado1")%>: "<%=paramBuscar%>",
		<%=Frases.getFrase("ESSalasResultado2")%>:<%=m%>,
		<%=Frases.getFrase("ESSalasResultado3")%>:<%=t%>,
		<%=Frases.getFrase("ESSalasResultado4")%>:<%=d%>
	</h2>
</section>
<section id="contenedor_salas">
	<div id=contenedor_salas_wrapper>
		<%
		if (mapaSalas == null || mapaSalas.size() == 0) {
			String enlaceBoton = "./salas?buscar=todas&m=todas&t=todas&d=todas";
		%>
		<article class="caja_sala">
			<div class="caja_img" id="caja_img_error">
				<a href=<%=enlaceBoton%>> <img
					src="img_salas/portadas/ErrorBusqueda.png" draggable="false">
				</a>

			</div>
			<div class="caja_titulo">
				<h2><%=Frases.getFrase("ESSalasNoFound")%></h2>
			</div>
			<div class="caja_boton" id="caja_boton_error">
				<a href=<%=enlaceBoton%>>
					<button>
						<span><%=Frases.getFrase("ESSalasBuscarTodas")%></span>
					</button>
				</a>
			</div>
		</article>
		<%
		} else {
		for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			Sala sala = par.getValue();
			String idSala = par.getKey();
			String nombreSala = sala.getNombre();
			String textoBoton = "Organizar partida";
			String enlaceBoton = "./verSala?idSala="+idSala;
			String modalidad = "Online";
			//si la tematica de la sala es suspenso, le agregamos una clase
			String rutaIconoTematica = "img_web/iconos_salas/" + NormalizeHelper.normalizarTexto(sala.getTematica()) + ".svg";
			File archivoImagen = new File(getServletContext().getRealPath("/") + rutaIconoTematica);
			if (!archivoImagen.exists()) {
				rutaIconoTematica = "img_web/iconos_salas/question.svg";
			}

			String rutaImagenPortada = "img_salas/portadas/" + idSala + ".png";
			File archivoImagenPortada = new File(getServletContext().getRealPath("/") + rutaImagenPortada);
			if (!archivoImagenPortada.exists()) {
				rutaImagenPortada = "img_salas/portadas/question.png";
			}
		%>
		<article class="caja_sala">
			<div class="caja_img caja_img_portada">
				<a href=<%=enlaceBoton%>> <img src="<%=rutaImagenPortada%>"
					alt="Portada" draggable="false">
				</a>

			</div>
			<div class="caja_titulo">
				<h2><%=nombreSala%></h2>
			</div>
			<div class="caja_sinopsis">
				<p><%=sala.getDescripcion()%></p>
			</div>
			<div class="caja_etiquetas">
				<div class="etiqueta jugadores"
					title="<%=Frases.getFrase("ESSalasBuscarTodas")%>">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/user.svg"
							alt="Jugadores:">
					</div>

					<div class="caja_text"><%=sala.getJugadoresMin()%>-<%=sala.getJugadoresMax()%></div>
				</div>
				<div class="etiqueta dificultad" title="Dificultad de la sala">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/lock.svg"
							alt="Dificultad:">
					</div>

					<div class="caja_text"><%=sala.getDificultad()%></div>
				</div>
				<div class="etiqueta tiempo" title="Tiempo máximo de la sala">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/clock.svg"
							alt="Tiempo:">
					</div>

					<div class="caja_text"><%=sala.getTiempoMax()%>'
					</div>
				</div>

				<div class="etiqueta tematica" title="Temática de la sala">
					<div class="caja_icon">
						<img class="icon" src="<%=rutaIconoTematica%>" alt="Tematica:">
					</div>

					<div class="caja_text"><%=sala.getTematica()%></div>
				</div>
				<div class="etiqueta modalidad" title="Modo de acceso a la sala">
					<div class="caja_icon">
						<img class="icon" src="img_web/iconos_salas/<%=NormalizeHelper.normalizarTexto(modalidad)%>.svg"
							alt="Modo">
					</div>

					<div class="caja_text"><%=modalidad%></div>
				</div>
			</div>
			<div class="caja_boton" id="caja_boton_ver">
				<a href=<%=enlaceBoton%>>
					<button>
						<span>Ver sala</span>
					</button>
				</a>
			</div>
		</article>

		<%
		}
		}
		%>
	
</section>
<style>
#contenedor_buscador {
	background-color: <%=mapaAppConfig.get("colorMenosOscuro")%>;
}

#caja_buscador {
	background-color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

#caja_buscador img {
	background-color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

select {
	color: <%=mapaAppConfig.get("colorMenosOscuro")%>
}

#contenedor_salas h2 {
	border-bottom-color: <%=mapaAppConfig.get("colorAcento")%>;
	color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

.caja_sala {
	background-color: <%=mapaAppConfig.get("colorClaro")%>;
}

.caja_sala:hover {
	box-shadow: 0 0 1.75em<%=mapaAppConfig.get("colorAcento")%>;
}

#caja_img_error {
	background-color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

.caja_img_portada img {
	background-color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

.etiqueta {
	background-color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}

.caja_boton button {
	background-color: <%=mapaAppConfig.get("colorAcento")%>;
	color: <%=mapaAppConfig.get("colorMuyOscuro")%>;
}

.caja_boton button:hover {
	background-color: <%=mapaAppConfig.get("colorOscuro")%>;
	color: <%=mapaAppConfig.get("colorAcento")%>;
}

.caja_sala a a:hover, a:active, a:focus {
	color: <%=mapaAppConfig.get("colorMuyClaro")%>;
}
</style>
<script>
    const selects = document.querySelectorAll('#contenedor_buscador form select');
    selects.forEach(select => {
      select.addEventListener('change', function() {
        const form = document.querySelector('#contenedor_buscador form');
        form.submit();
      });
    });
  </script>