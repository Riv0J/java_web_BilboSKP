<%@ page
	import="java.util.Vector, java.util.HashMap, java.util.Map, java.util.Locale,java.util.Date, java.time.LocalDate, java.io.File, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica, model.Horario, model.Suscriptor, view.StringHelper, view.DateHelper, view.Icon"%>
<%
Object sus = (Object) request.getAttribute("suscriptor");
Sala salaAMostrar = (Sala) request.getAttribute("salaAMostrar");
String idSala = (String) request.getParameter("idSala");
boolean esSalaFisica = (boolean) request.getAttribute("esSalaFisica");
if (salaAMostrar == null) {
	response.sendRedirect("./salas");
}

String modalidad = "Online";
String textoBoton = "Organizar partida";
String enlaceBoton = "./organizar?idSala="+idSala;

String direccion = null;
LocalDate fechaSeleccionada = (LocalDate) request.getAttribute("fechaSeleccionada");
Vector<LocalDate> fechasAMostrar = null;
Vector<Horario> horariosAMostrar = null;

if (esSalaFisica == true) {
	modalidad = "Reserva";
	textoBoton = "Reservar sala";
	enlaceBoton = "./reservar?idSala="+idSala;
	direccion = ((SalaFisica)salaAMostrar).getDireccion();
	fechasAMostrar = (Vector<LocalDate>) request.getAttribute("fechasAMostrar");
	horariosAMostrar = (Vector<Horario>) request.getAttribute("horariosAMostrar");
}
//este if, checkea si no hay suscriptor en la sesion, y si no lo hay, pone un script que impide usar el boton de organizar, y mas bien revela la caja de login
if(!(sus instanceof Suscriptor)){ 
	enlaceBoton = "#";
%>
	<script>
		document.querySelector("#boton_reservar_organizar").addEventListener("click", function() {
		document.querySelector("#caja_login").style.display = "flex";
		});
	</script>
<% 
}
String rutaImagenPortadaLarga = "./img_salas/portadas_largas/"+idSala+".png";
String rutaIconoTematica = "img_web/iconos_salas/" + StringHelper.normalizarTexto(salaAMostrar.getTematica()) + ".svg";
String tematicaNormalizada = StringHelper.normalizarTexto(salaAMostrar.getTematica());
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
			
			<% if (esSalaFisica == true) { %>
				<div id="caja_jugabilidad">
					<p>Esta es una sala física, por lo que funciona por medio de una
						reserva. ¡Puedes seleccionar entre horarios disponibles y
						seleccionar la cantidad de participantes que acudirán a la sala!</p>
				</div>
				<div id="caja_reserva">
				<% if(fechasAMostrar==null || fechasAMostrar.size()==0){ %>
						<div class="caja_mensaje">
							<i class="<%=Icon.getIconHTMLClass("reserva")%>"></i><div>No quedan fechas libres para reservar en esta sala, ¡por favor echa un vistazo más tarde!</div>
						</div>
				<% } else { %>
					<form action="./verSala" method="GET" id="caja_fecha" class="linea_form">
						<input type="hidden" name="idSala" value="<%=idSala%>">
						<label for="fecha_reserva">Escoge una fecha:</label> 
						<select id="fechas" class="bilboskp_select" name="fechaSeleccionada">
					    <% if(fechaSeleccionada == null) { %>
						    		<option value="" selected="" >Selecciona una fecha</option>
							    	 <% for(LocalDate localDate: fechasAMostrar){
							                String localDateString = StringHelper.getLocalDateString(localDate);  %>
							                <option value="<%=localDateString%>"><%=localDateString%></option>
							         <% } %>
						    	 
					      <% } else if (fechaSeleccionada != null){ 
					    	String fechaSeleccionadaString = StringHelper.getLocalDateString(fechaSeleccionada);
					          for(LocalDate localDate: fechasAMostrar){
					                String localDateString = StringHelper.getLocalDateString(localDate); 
					                System.out.println(fechaSeleccionadaString);
									System.out.println(localDateString); %>
					                <option value="<%=localDateString%>" <% if(fechaSeleccionadaString.equals(localDateString)){ %> selected <% } %>><%=localDateString%></option>
					        <%}
					    }%>
					    </select>  
					</form>
				<% if (fechaSeleccionada != null){ 
					if(horariosAMostrar!=null  && horariosAMostrar != null && horariosAMostrar.size()>0){ %>
						<form action="./reservar" method="POST">
							<div id="caja_horarios" class="linea_form">
								<label for="horarios">Horarios disponibles:</label>
								<select id="horarios" class="bilboskp_select" name="horarios">
									<%for(Horario horario: horariosAMostrar){
										if(horario.isDisponible()==false){ continue; }
										Date fecha= horario.getFechaHora();
										String stringHorario = StringHelper.getDiaSemana(fecha)+" "+fecha.getDate()+", "+fecha.getHours()+":";
										int minutos = fecha.getMinutes();
										if (minutos==0){ stringHorario+= "00"; } else { stringHorario+= ""+minutos; }
										%>
										<option value="<%=fecha.toString()%>"><%=stringHorario%></option>
									<% } %>
								</select>
							</div>
							<div id="caja_numero_jugadores" class="linea_form">
								<label for="num_jugadores">Número de jugadores que participarán:</label> 
								<select id="num_jugadores" class="bilboskp_select" name="num_jugadores" >
									<% 
									int minJugadores = salaAMostrar.getJugadoresMin();
									int maxJugadores = salaAMostrar.getJugadoresMax();
									for (int i = minJugadores; i <= maxJugadores; i++) { 
									%>
									<option value="<%=i%>"><%=i%></option>
									<% } %>
								</select>
							</div>
							<div id="contenedor_boton" class="linea_form">
								<a href=<%=enlaceBoton%>>
									<button type=input class="bilboskp_icon_button">
										<i class="<%=Icon.getIconHTMLClass(modalidad)%>"></i>
										<div>
											<%=textoBoton%>
										</div>
									</button>
								</a>
							</div>
						</form>
						<% } else { %>
						<div>No hay horarios disponibles para esa fecha, ¡Echa un ojo en un rato!</div>
						<% } %>
				<% }  else if (fechaSeleccionada==null){ %>
				<div>¡Seleciona una fecha disponible para poder ver los horarios!</div>
				<% } %>
			</div>
				<% } %>
			<% } else { %>
			<div id="caja_jugabilidad">
				<p>Esta es una sala online, por lo que puedes acceder a ella en
					cualquier momento, pero eso sí, asegúrate de traer a tus amigos
					para vencerla rápido, y por supuesto pasar unas buenas risas.
					Podrás invitar a tus amigos cuando estés organizando la partida.</p>
			</div>
			<div id="contenedor_boton">
				<a href=<%=enlaceBoton%>>
					<button id="boton_reservar_organizar" class="bilboskp_icon_button">
						<i class="<%=Icon.getIconHTMLClass(modalidad)%>"></i>
						<div>
							<%=textoBoton%>
						</div>
					</button>
				</a>
			</div>
			<% } %>
		</div>
		<div id="caja_img">
		<style>
			#caja_img{
				height: 100%;
				background: rgb(2,0,36);
				background: linear-gradient(135deg, rgba(2,0,36,0) 0%, rgba(2,0,36,0) 55%, rgba(0,0,0,0.85) 100%);
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
<script>
	const selectFechas = document.querySelector('#fechas');
	selectFechas.addEventListener('change', function() {
	const form = document.querySelector('#caja_fecha');
	form.submit();
	});
</script>
<style>
.linea_form{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	gap:3%;
	margin-top:1%;
	
}
#num_jugadores{
	width:10%;
}
#horarios{
	text-align: center;
}
#fechas{
}
#wrapper_ver_sala {
	height: 85vh;
	background-image: url(<%=rutaImagenPortadaLarga%>);
	background-size: cover;
	color: var(--text-color);
	animation: fondo 30s infinite;
	animation-timing-function: ease;
}
#wrapper_ver_sala p{
	line-height: 1.2;
	text-align: justify;
	font-size: 1.75em;
	text-shadow: 1px 1px 0 black, -1px -1px 0 black, 1px -1px 0 black, -1px 1px 0 black;
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
	background: linear-gradient(300deg, rgba(2,0,36,0.05) 30%, rgba(255,25,25,0.05) 75%, rgba(198,12,2,0.8) 100%)
}

#caja_info, #caja_img {
	width: 50%;
}

#caja_info {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 3%;
	height: 100%;
}

#caja_info>* {
	width: 70%;
}

#contenedor_boton {
	padding-top: 2%;
	display: flex;
	align-items: center;
	justify-content: center;
}

#contenedor_boton a{
	width: 50%;
	display: flex;
    justify-content: center;
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

<% if (esSalaFisica== true){ %>
	#contenedor_boton button{
		font-size: 1.3em;
	}
	#contenedor_boton i{
		font-size: 1.5em;
	}
<% } %>
.caja_mensaje{
	margin-top: 5%;
    display: flex;
    flex-direction: row;
    gap: 5%;
    justify-content: center;
    align-items: center;

}
.caja_mensaje i{
    font-size: 1.75em;
}
#caja_titulo {
	font-size: 2em;
	letter-spacing: 0.1em;
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
  	background-position: -1% 4%;
    background-size: 102.9%;
  }
  25% {
    background-position: 2% 4%;
    background-size: 103%;
  }
  50% {
	background-position: 1% 3%;
    background-size: 102.9%;
  }
  75% {
	background-position: 4% 2%;
    background-size: 102.8%;
  }
  100% {
	background-position: -1% 4%;
    background-size: 102.9%;
  }
}
@media (max-width: 1590px) {
}

@media (max-width: 1367px) {
	#caja_info>*{
		width:90%;
	}
	#wrapper_ver_sala p{
		line-height: 1.1;
	    text-align: justify;
	    font-size: 1.75em;
	}
	#caja_ver_sala{
	}
	#caja_img{
	}
	#caja_info{
		gap: 1%;
	}
	#caja_titulo{
		margin-bottom: 3%;

	}
	#caja_sinopsis p:nth-child(1){
		margin-bottom: 4%;
	}
	#contenedor_boton{
		padding-top:5%;
	}
	#contenedor_boton button{
		font-size: 1.65em;
	}

}

@media (max-width: 1280px) {
	#caja_info>*{
		width:90%;
	}
	#wrapper_ver_sala p{
		line-height: 1.1;
	    text-align: justify;
	    font-size: 1.5em;
	}
	#caja_img{
		width: 35%;
	}
	#caja_info{
		width: 65%;
		gap: 1%;
	}
	.etiqueta{
		font-size: 1em;
		width: 14%;
	}
	.modalidad, .dificultad, .jugadores {
   		width: 18%;
	}
	.tematica{
		width: 20%;
	}
	#caja_sinopsis p:nth-child(1){
		margin-bottom: 4%;
	}
	#contenedor_boton a{
		width: 40%;
	}
	#contenedor_boton button{
		font-size: 1.2em;
	}
	.linea_form{
		flex-direction: column;
		font-size: 0.8em;
		margin-bottom: 1%;
	}
	#contenedor_boton {
	  padding-top: 5%;
	}
	#num_jugadores{
	  width: auto;
	}
	form label{
		margin-bottom: 1%;
	}
	#contenedor_boton {
	  padding-top: 1%;
	}
}

@media (max-width: 1090px) {
	#caja_info>*{
		width:100%;
	}
	#wrapper_ver_sala{
		animation: none;
		height: 95vh;
		background-position: 50%;
	}
	#wrapper_ver_sala p{
		line-height: 1.1;
	    text-align: justify;
	    font-size: 1.5em;
	}
	#caja_ver_sala{
	}
	#caja_img{
		display:none;
	}
	#caja_info{
		width: 70%;
		gap: 1%;
	}
	.etiqueta{
		padding: 0.5%;
		font-size: 1em;
		width: 12%;
	}
	.modalidad, .dificultad, .jugadores {
   		width: 20%;
	}
	.tematica{
		width: 18%;
	}
	#caja_sinopsis p:nth-child(1){
		margin-bottom: 3%;
	}
	#contenedor_boton a {
	    width: 40%
	}
	form label{
		margin-bottom: 1%;
	}
	#contenedor_boton {
	  padding-top: 2%;
	}
	#caja_fecha{
		margin-bottom: 0;
	}
}

@media (max-width: 920px) {
	#wrapper_ver_sala{
		animation: none;
		height: 95vh;
		background-position: 65%;
	}
	#wrapper_ver_sala h2{
		font-size: 1.5em;
	}
	#caja_info{
		width: 80%;
		gap: 1%;
	}
	form label{
		margin-bottom: 2%;
	}
}

@media (max-width: 700px){
	#contenedor_boton a{
		width: 50%;
	}
	#contenedor_boton button {
	}
}
@media (max-width: 600px){
	#wrapper_ver_sala{
		background-position: 65%;
	}
	#wrapper_ver_sala h2{
		font-size: 1.3em;
	}
	#caja_titulo{
	}
	#caja_etiquetas{
		gap:1%;
	}
	.etiqueta{
		font-size: 1em;
		width: 22%;
	}
	.dificultad, .jugadores {
   		width: 26%;
	}
	.modalidad{
		width: 32%;
	}
	.tematica{
		width: 37%;
	}
	#contenedor_boton a{
	width: 75%;
	}
	#contenedor_boton{
	  padding-top: 5%;
	}
	.linea_form{
		margin-top: 5%;
	}
}
</style>