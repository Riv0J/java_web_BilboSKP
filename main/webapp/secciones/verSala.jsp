<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica, view.NormalizeHelper, view.Icon"%>
<%
Sala salaAMostrar = (Sala) request.getAttribute("salaAMostrar");
String idSala = (String) request.getParameter("idSala");
boolean esSalaFisica = (boolean) request.getAttribute("esSalaFisica");
if (salaAMostrar == null) {
	response.sendRedirect("./salas?buscar=todas&m=todas&t=todas&d=todas");
}

String modalidad = "Online";
String textoBoton = "Organizar partida";
String enlaceBoton = "./organizar?idSala="+idSala;
if (esSalaFisica == true) {
	modalidad = "Reserva";
	textoBoton = "Realizar reserva";
	enlaceBoton = "./reservar?idSala="+idSala;
}
String rutaImagenPortadaLarga = "./img_salas/portadas_largas/"+idSala+".png";
String rutaIconoTematica = "img_web/iconos_salas/" + NormalizeHelper.normalizarTexto(salaAMostrar.getTematica()) + ".svg";
String tematicaNormalizada = NormalizeHelper.normalizarTexto(salaAMostrar.getTematica());
%>
<section id="wrapper_ver_sala">
	<div id="caja_ver_sala">
		<div id="caja_info">
			<div id="caja_titulo">
				<h2><%=salaAMostrar.getNombre()%></h2>
			</div>
			<div class="caja_subtitulo"></div>
			<div id="caja_etiquetas">
				<div class="etiqueta coste" title="Coste">
					<i class="<%=Icon.getIconHTMLClass("cupon")%>"></i>
					<div class="caja_text">1</div>
				</div>
				<div class="etiqueta jugadores" title="Jugadores">
					<i class="<%=Icon.getIconHTMLClass("user")%>"></i>
					<div class="caja_text"><%=salaAMostrar.getJugadoresMin()%>-<%=salaAMostrar.getJugadoresMax()%></div>
				</div>
				<div class="etiqueta dificultad" title="Dificultad de la sala">
					<i class="<%=Icon.getIconHTMLClass("lock")%>"></i>
					<div class="caja_text"><%=salaAMostrar.getDificultad()%></div>
				</div>
				<div class="etiqueta tiempo" title="Tiempo máximo de la sala">
					<i class="<%=Icon.getIconHTMLClass("clock")%>"></i>
					<div class="caja_text"><%=salaAMostrar.getTiempoMax()%>'</div>
				</div>
				<div class="etiqueta tematica <%=tematicaNormalizada%>" title="Temática de la sala">
					<i class="<%=Icon.getIconHTMLClass(tematicaNormalizada)%>"></i>
					<div class="caja_text"><%=salaAMostrar.getTematica()%></div>
				</div>
				<div class="etiqueta modalidad" title="Modo de acceso a la sala">
					<i class="<%=Icon.getIconHTMLClass(modalidad)%>"></i>
					<div class="caja_text"><%=modalidad%></div>
				</div>
				<div class="etiqueta edad" title="Edad recomendada de la sala">
					<i class="<%=Icon.getIconHTMLClass("age")%>"></i>
					<div class="caja_text">+<%=salaAMostrar.getEdad_recomendada()%></div>
				</div>
			</div>
			<div class="caja_subtitulo">
				<h2>Sinopsis</h2>
			</div>
			<div id="caja_sinopsis">
				<p><%=salaAMostrar.getDescripcion()%></p>
			</div>
			<% if (esSalaFisica == true) { 
			String direccion = ((SalaFisica)salaAMostrar).getDireccion();
			%>
			<div id="caja_jugabilidad">
				<p>Esta es una sala física, por lo que funciona por medio de una
					reserva. ¡Puede seleccionar entre horarios disponibles y
					seleccionar la cantidad de participantes que acudirán a la sala!</p>
			</div>
			<div id="caja_reserva">
				<!--  <div id="caja_ubicacion">
					<a href="https://www.google.es/maps/search/<%=direccion%>/">Dirección: <%=direccion%></a> 
				</div>-->
				<div id="caja_fecha">
					<label for="fecha_reserva">Fecha de la reserva:</label> <input
						type="date" id="fecha_reserva" name="fecha_reserva">
				</div>
				<div id="caja_numero_jugadores">
					<label for="num_jugadores">Número de jugadores que
						participarán:</label> <select id="num_jugadores" class="bilboskp_select" name="num_jugadores" >
						<%
						int maxJugadores = salaAMostrar.getJugadoresMax();
						for (int i = 1; i <= maxJugadores; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>
			<%
			} else {
			%>
			<div id="caja_jugabilidad">
				<p>Esta es una sala online, por lo que puedes acceder a ella en
					cualquier momento, pero eso sí, asegúrate de traer a tus amigos
					para vencerla rápido, y por supuesto pasar unas buenas risas.
					Podrás invitar a tus amigos cuando estés organizando la partida.</p>
			</div>

			<%
			}
			%>

			<div id="contenedor_boton">
				<a href=<%=enlaceBoton%>>
					<button class="bilboskp_icon_button">
						<i class="<%=Icon.getIconHTMLClass(modalidad)%>"></i>
						<div>
							<%=textoBoton%>
						</div>

					</button>
				</a>
			</div>
		</div>
		<div id="caja_img">
		<style>
		#caja_img{
			height: 100%;
			background: rgb(2,0,36);
			background: linear-gradient(135deg, rgba(2,0,36,0) 0%, rgba(2,0,36,0) 55%, rgba(0,0,0,0.73) 100%);
			animation: fondo2 15s infinite;
			animation-timing-function: ease;
			opacity: 1;
		}
		
					@keyframes fondo2 {
			  0% {
			  opacity: 1;
			    background-position: 0 0;
			  }
			  50% {
			  opacity: 0.2;
			    background-position: 50% 50%;
			  }
			  75%{
			  opacity:0.4;}
			  100% {
			  opacity: 1;
			    background-position: 0 0;
			  }
			}
		</style>
		</div>
	</div>
</section>

<style>
#wrapper_ver_sala {
	height: 85vh;
	background-image: url(<%=rutaImagenPortadaLarga%>);
	background-size: cover;
	color: var(--text-color);
	animation: fondo 25s infinite;
	animation-timing-function: ease;
}
#wrapper_ver_sala p{
	line-height: 1.2;
	text-align: justify;
	font-size: 1.75em;
}
#wrapper_ver_sala h2{
	letter-spacing: 0.1em;
	font-size: 1.75em;
	text-align: center;
	color: var(--text-color);
}
#caja_ver_sala {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	background: linear-gradient(283deg, rgba(2,0,36,0.05) 30%, rgba(255,25,25,0.2) 66%, rgba(198,12,2,1) 100%);
}

#caja_info, #caja_img {
	width: 50%;
}

#caja_info {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 4%;
	height: 100%;
}

#caja_info>* {
	width: 70%;
}

#contenedor_boton {
	padding-top: 3%;
	font-size: 1.15em;
	display: flex;
	align-items: center;
	justify-content: center;
}
#contenedor_boton a{
	width: 50%;
}
#contenedor_boton button{
	font-size: 1.45em;
	width: 100%;
}
i{
	font-size: 1.25em;
}
#contenedor_boton i{
	font-size: 2em;
}

#caja_titulo {
	font-size: 2em;
	letter-spacing: 0.1em;
	text-stroke: 0.5em solid red;
}

.caja_subtitulo {
	font-size: 2em;
	display: none;
}

#caja_etiquetas{
	font-size: 1.5em;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	width: 60%;
	gap: 3%;
	margin-top: 2%;
	margin-bottom: 1%;
}

.etiqueta {
	font-size: 1.25em;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: row;
	text-align: center;
	gap: 6%;
	width: 18%;
	height: 35%;
	border-radius: 1em;
	margin-bottom: 2%;
	padding: 1%;
	padding-left: 4%;
	padding-right: 4%;
	background-color: var(--text-color);
	color: var(--bg-oscuro);
}
.tematica{
	width: 28%;
}
.suspenso{
width: 34%;
}
.jugadores, .modalidad, .dificultad {
	width: 24%;
}

.tematica .caja_text{
	text-align: left;
}
#caja_reserva{
	font-size: 1.75em;
}
#caja_fecha{
	margin-bottom: 2%;
}
#caja_reserva input[type="date"]{
	padding: 0.5%;
	border-radius: 0.25em;
}
#caja_reserva select{
	padding: 0.5%;
	border-radius: 0.25em;
}
@keyframes fondo {
  0% {
    background-position: -1% 5%;
    background-size: 153em;
  }
  10%{
  	background-position: 3% 8%;
  }
  25% {
    background-position: 2% 6%;
    background-size: 152em;
  }
  50% {
    background-position: 1% 3%;
    background-size: 153em;
  }
  10%{
  	background-position: 3% 4%;
  }
  75% {
    background-position: 4% 3%;
    background-size: 154em;
  }
  100% {
    background-position: 1% 5%;
    background-size: 153em;
  }
}
</style>