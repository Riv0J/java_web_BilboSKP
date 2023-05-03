<%@ page
	import="java.util.Vector, java.util.HashMap, java.util.Map, java.util.Locale,java.util.Date, java.time.LocalDate, java.io.File, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica, model.Horario,view.StringHelper, view.DateHelper, view.Icon, model.PartidaOnline, model.Suscriptor"%>
<%
PartidaOnline partidaOnline = (PartidaOnline) request.getAttribute("partidaOnline");

Sala salaPartida = partidaOnline.getSala();
String idSala = (String) request.getParameter("idSala");
int codInvitacion = partidaOnline.getCodInvitacion();
Suscriptor anfitrion = partidaOnline.getAnfitrion();

String rutaImagenPortadaLarga = "./img_salas/portadas_largas/"+idSala+".png";
String rutaIconoTematica = "img_web/iconos_salas/" + StringHelper.normalizarTexto(salaPartida.getTematica()) + ".svg";
String tematicaNormalizada = StringHelper.normalizarTexto(salaPartida.getTematica());


%>
<section id="wrapper_ver_sala">
	<div id="caja_ver_sala">
		<div id="caja_info">
			<div id="caja_titulo">
				<h2><%=salaPartida.getNombre()%></h2>
			</div>
			<div class="caja_subtitulo"></div>
			<div id="caja_etiquetas">
				<div class="etiqueta coste" title="Coste">
					<i class="<%=Icon.getIconHTMLClass("cupon")%>"></i>
					<div class="caja_text">1</div>
				</div>
				<div class="etiqueta jugadores" title="Jugadores">
					<i class="<%=Icon.getIconHTMLClass("user")%>"></i>
					<div class="caja_text"><%=salaPartida.getJugadoresMin()%>-<%=salaPartida.getJugadoresMax()%></div>
				</div>
				<div class="etiqueta dificultad" title="Dificultad de la sala">
					<i class="<%=Icon.getIconHTMLClass("lock")%>"></i>
					<div class="caja_text"><%=salaPartida.getDificultad()%></div>
				</div>
				<div class="etiqueta tiempo" title="Tiempo m�ximo de la sala">
					<i class="<%=Icon.getIconHTMLClass("clock")%>"></i>
					<div class="caja_text"><%=salaPartida.getTiempoMax()%>'</div>
				</div>
				<div class="etiqueta tematica <%=tematicaNormalizada%>" title="Tem�tica de la sala">
					<i class="<%=Icon.getIconHTMLClass(tematicaNormalizada)%>"></i>
					<div class="caja_text"><%=salaPartida.getTematica()%></div>
				</div>
				<div class="etiqueta modalidad" title="Modo de acceso a la sala">
					<i class="<%=Icon.getIconHTMLClass("online")%>"></i>
					<div class="caja_text">"online"</div>
				</div>
				<div class="etiqueta edad" title="Edad recomendada de la sala">
					<i class="<%=Icon.getIconHTMLClass("age")%>"></i>
					<div class="caja_text">+<%=salaPartida.getEdad_recomendada()%></div>
				</div>
			</div>
			<div class="caja_subtitulo">
				<h2>Sinopsis</h2>
			</div>
			<div id="caja_sinopsis">
				<p><%=salaPartida.getDescripcion()%></p>
			</div>
			<div id="caja_jugabilidad">
				<p>Esta es una sala online, por lo que puedes acceder a ella en
					cualquier momento, pero eso s�, aseg�rate de traer a tus amigos
					para vencerla r�pido, y por supuesto pasar unas buenas risas.
					Podr�s invitar a tus amigos cuando est�s organizando la partida.</p>
			</div>
			<div id="contenedor_boton">
				<a href="">
					<button class="bilboskp_icon_button">
						<i class="<%=Icon.getIconHTMLClass("online")%>"></i>
						<div>
							Iniciar partida
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
	width:6%;
}
#horarios{
	text-align: center;
	width:30%;
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
	margin-top: 5%;
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
	#caja_ver_sala{
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
   		width: 16%;
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
	/*#caja_sinopsis, #caja_jugabilidad{
		background-color: var(--text-color);
		color: var(--bg-oscuro);
		padding: 0.5%;
	}*/
	#caja_info{
		width: 80%;
		gap: 1%;
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
	.modalidad, .dificultad, .jugadores {
   		width: 26%;
	}
	.tematica{
		width: 37%;
	}
	#contenedor_boton a{
	width: 75%;
	}
	#contenedor_boton{
	  padding-top: 15%;
	}
}
</style>