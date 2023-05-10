<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Sala,view.Traductor,model.SalaOnline,model.SalaFisica,view.AppConfig,view.StringHelper, view.Traductor, view.CookieHelper"%>
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
System.out.println("EL LENGUAJE CAPTADO ES: "+leng);
HashMap<String, Sala> mapaSalas = (HashMap<String, Sala>) request.getAttribute("mapaSalas");
ArrayList<String> tematicasDisponibles = (ArrayList<String>) request.getAttribute("tematicasDisponibles");
ArrayList<String> dificultadesDisponibles = (ArrayList<String>) request.getAttribute("dificultadesDisponibles");

String m = request.getParameter("m");
String d = request.getParameter("d");
String t = request.getParameter("t");
String paramBuscar = request.getParameter("buscar");

if (dificultadesDisponibles != null && tematicasDisponibles != null) {
%>
<link rel="stylesheet" href="css/salas.css">
<section id="contenedor_buscador">
	<form>
		<div id="wrapper_buscador">
			<div id="caja_buscador">
				<img alt="" src="img_web/iconos_salas/lupa.svg"> <input
					type="text" id="buscar" name="buscar" value="<%=paramBuscar%>"
					placeholder="<%=Traductor.get(leng,"salas1")%>">
			</div>
		</div>
		<div id="wrapper_filtros">
			<div id="caja_filtros">
				<div class="caja_select">
					<select name="m">
						<option <%if (m.equals("todas")) {%> selected <%}%> value="todas"><%=Traductor.get(leng,"salas2")%></option>

						<option <%if (m.equals("online")) {%> selected <%}%>
							value="online"><%=Traductor.get(leng,"salas3")%></option>
						<option <%if (m.equals("fisicas")) {%> selected <%}%>
							value="fisicas"><%=Traductor.get(leng,"salas4")%></option>

					</select>
				</div>
				<div class="caja_select">
					<select name="t">
						<option value="todas"><%=Traductor.get(leng,"salas5")%></option>
						<%
						for (String tematica : tematicasDisponibles) {
											String tematicaNormalizada = StringHelper.normalizarTexto(tematica);
						%>
						<option <%if (t.equals(tematicaNormalizada)) {%> selected <%}%>
							value="<%=tematicaNormalizada%>"><%=Traductor.get(leng,tematicaNormalizada)%></option>

						<%
						}
						%>

					</select>
				</div>
				<div class="caja_select">
					<select name="d">
						<option value="todas"><%=Traductor.get(leng,"salas6")%></option>
						<%
						for (String dificultad : dificultadesDisponibles) {
											String dificultadNormalizada = StringHelper.normalizarTexto(dificultad);
						%>
						<option <%if (d.equals(dificultadNormalizada)) {%> selected <%}%>
							value="<%=dificultadNormalizada%>"><%=Traductor.get(leng,dificultadNormalizada)%></option>
						<%
						}
						%>
					</select>
				</div>
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
<section id="contenedor_salas">
	<div id="caja_titulo_resultados">
	<h2>
		<%=Traductor.get(leng,"salas7")%> <%=numeroResultados%> <%=Traductor.get(leng,"salas8")%>: "<%=paramBuscar%>",
		<%=Traductor.get(leng,"modalidad")%>: <%=m%>,
		<%=Traductor.get(leng,"tematica")%>: <%=t%>,
		<%=Traductor.get(leng,"dificultad")%>: <%=d%>
	</h2>
</div>
	<div id=contenedor_salas_wrapper>
		<%
		if (mapaSalas == null || mapaSalas.size() == 0) {
			String enlaceBoton = "./salas?buscar=todas&m=todas&t=todas&d=todas";
		%>
		<article class="caja_sala" style="animation: entrada 0.25s forwards;">
			<div class="caja_img" id="caja_img_error">
				<a href=<%=enlaceBoton%>> <img
					src="img_salas/portadas/ErrorBusqueda.png" draggable="false">
				</a>


			</div>
			<div class="caja_titulo">
				<h2><%=Traductor.get(leng,"salas9")%></h2>
			</div>
			<div class="caja_boton" id="caja_boton_error">
				<a href=<%=enlaceBoton%>>
					<button>
						<span><%=Traductor.get(leng,"salas10")%></span>
					</button>
				</a>
			</div>
		</article>
		<%
		} else {
				int contadorSalas = 1;
				for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			double tiempoAnim = contadorSalas*0.8;
			Sala sala = par.getValue();
			String idSala = par.getKey();
			
			String nombreSala = sala.getNombre();
			String textoBoton = "Organizar partida";
			String enlaceBoton = "./verSala?idSala=" + idSala;
			String modalidad = "Online";
			if(sala instanceof SalaFisica){
				modalidad = "Reserva";
			}
			String modalidadNormalizada = StringHelper.normalizarTexto(modalidad);
			String tematicaNormalizada = StringHelper.normalizarTexto(sala.getTematica());
			//si la tematica de la sala es suspenso, le agregamos una clase
			String rutaIconoTematica = "img_web/iconos_salas/" + StringHelper.normalizarTexto(sala.getTematica()) + ".svg";
			File archivoImagen = new File(getServletContext().getRealPath("/") + rutaIconoTematica);
			if (!archivoImagen.exists()) {
				rutaIconoTematica = "img_web/iconos_salas/question.svg";
			}

			String rutaImagenPortada = "img_salas/portadas/" + idSala + ".png";
			File archivoImagenPortada = new File(getServletContext().getRealPath("/") + rutaImagenPortada);
			if (!archivoImagenPortada.exists()) {
				rutaImagenPortada = "img_salas/portadas/Question.png";
			}
		%>
		<article class="caja_sala" style="animation: entrada <%=tiempoAnim%>s forwards;">
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
				<div class="etiqueta jugadores" title="Jugadores">
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

				<div class="etiqueta tematica <%=tematicaNormalizada%>" title="Temática de la sala">
					<div class="caja_icon">
						<img class="icon" src="<%=rutaIconoTematica%>" alt="Tematica:">
					</div>
					<div class="caja_text"><%=Traductor.get(leng,tematicaNormalizada)%></div>
				</div>
				<div class="etiqueta modalidad" title="Modo de acceso a la sala">
					<div class="caja_icon">
						<img class="icon"
							src="img_web/iconos_salas/<%=modalidadNormalizada%>.svg"
							alt="Modo">
					</div>

					<div class="caja_text"><%=Traductor.get(leng, modalidadNormalizada)%></div>
				</div>
			</div>
			<div class="caja_boton" id="caja_boton_ver">
				<a href=<%=enlaceBoton%>>
					<button>
						<span><%=Traductor.get(leng,"salas11")%></span>
					</button>
				</a>
			</div>
		</article>

		<%
		contadorSalas +=1;
		}
	}
	%>
</section>
<script>
    const selects = document.querySelectorAll('#contenedor_buscador form select');
    selects.forEach(select => {
      select.addEventListener('change', function() {
        const form = document.querySelector('#contenedor_buscador form');
        form.submit();
      });
    });
</script>
  <style>
  
  .caja_sala {
  	opacity: 0;
  }
	@keyframes entrada { 
		0% {
			opacity: 0;
		}
		100% {
			opacity: 1;
		}
	}
  </style>