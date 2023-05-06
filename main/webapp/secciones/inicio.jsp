 <%@ page
	import="model.Suscriptor, model.SalaOnline, control.BilboSKP, view.Mensaje, java.util.Vector, java.io.File"%>
<%
session.setAttribute("urlPrevia", "index.jsp");
//System.out.println("JSP Inicio establecida url previa = index.jsp");
Vector<SalaOnline> vectorSalasMasJugadas = new Vector<SalaOnline>();
try {
	vectorSalasMasJugadas = BilboSKP.getSalasMasJugadas(3);
} catch (Throwable e) {
	e.printStackTrace();
}
%>
<link rel="stylesheet" href="css/inicio.css">
<main>
<div class="lamp">
  <div class="lampara" id="lampara"></div>
  <div class="luz" id="luz"></div>
</div>
	<jsp:include page="../plantillas/unirse.jsp"></jsp:include>
	<section class="principal">
		<div id="caja_principal">
			<h1 class="bilbosk_h1">Experimenta nuestras salas de escape</h1>
			<p class="bilboskp_p">Sumérgete en una experiencia de juego única
				sin salir de tu casa con nuestras emocionantes salas de escape
				virtuales. ¿Estás listo para poner a prueba tus habilidades mentales
				y tu capacidad de resolución de problemas?</p>
			<div class="flex_center">
				<a class="flex_center" href="./salas"><button class="bilboskp_icon_button">Jugar Ahora</button></a> 
				<a class="flex_center" href="#"><button id="boton_unirse" class="bilboskp_icon_button_inverted">Unirse a partida</button></a>
			</div>
		</div>
		<div class="llave">
			<img src="img_web/inicio/lampara.png" alt="">
		</div>
	</section>

	<section class="caja_titulo">
		<h2 class="bilbosk_h2"><< ¡Descubre nuestras salas online más
			jugadas! >></h2>
	</section>
	<section class="card-container">
		<% for (SalaOnline so : vectorSalasMasJugadas) {
			String rutaImagenPortada = "img_salas/portadas/SO" + so.getIdSala() + ".png";
			File archivoImagenPortada = new File(getServletContext().getRealPath("/") + rutaImagenPortada);
			if (!archivoImagenPortada.exists()) {
				rutaImagenPortada = "img_salas/portadas/Question.png";
			}%>
		<div class="card">
			<img src="<%=rutaImagenPortada%>" alt="Foto Scape room">
			<div class="card-content">
				<h2><%=so.getNombre()%></h2>
				<p><%=so.getDescripcion()%></p>
			</div>
		</div>
		<% } %>
	</section>
	<section class="caja_titulo caja_textura">
		<h2 class="bilbosk_h2">Salas que te harán desafiar tu capacidad mental</h2>
	</section>
	<section class="card-container2">
		<div class="card">
			<img src="img_web/inicio/multijugador.png" alt="Foto del scape room">
			<div class="card-content">
				<h2>SOLO O CON AMIGOS</h2>
				<p>Puedes realizar cualquiera de nuestros escapes de forma
					individual o en grupo. Si no das con la tecla quizás otro/a si lo
					haga. El precio NO cambia.
				</p>
			</div>
		</div>
		<div class="card">
			<img src="img_web/inicio/senal.png" alt="Foto del scape room">
			<div class="card-content">
				<h2>MÚLTIPLES AVENTURAS</h2>
				<p>Tenemos actualmente varias historias, y estamos trabajando en
					muchas más. Cada una, tiene tanto una dificultad como un tiempo
					estimado diferente.</p>
			</div>
		</div>
		<div class="card">
			<img src="img_web/inicio/innovacion.png" alt="Foto del scape room">
			<div class="card-content">
				<h2>¿CÓMO FUNCIONA?</h2>
				<p>Resuelve puzzles y encuentra la solución en tiempo limitado.
					Trabaja solo o en equipo y comunícate a través de chat en salas de
					escape online.</p>
			</div>
		</div>
	</section>
</main>
<script>
/*script para unirse*/
	document.querySelector("#boton_unirse").addEventListener("click", function() {
		document.querySelector("#caja_unirse").style.display = "flex";
		document.querySelector("#caja_login").style.display = "none";
	});
/*script para lampara*/
document.querySelector('.luz').addEventListener('click', function() {
  this.classList.add('clicked');
  lampara.classList.add('clicked');
});</script>
<style>  /* Estilos para la lÃ¡mpara */
.lampara {
position: absolute;
top: 0;
left: 80%;
transform: translateX(-50%);
width: 100px;
height: 400px;
  background-image: url('././img_web/inicio/lamparaCandil.png');
background-size: cover;
transform-origin: top center;
animation: vaiven 2.5s cubic-bezier(0.5, 0, 0.5, 1) infinite alternate;}

@keyframes vaiven {
  0% {
  transform: translateX(-50%) rotate(-7deg);
}
100% {
  transform: translateX(-50%) rotate(7deg);
}
}
.luz {
position: absolute;
top: -5;
left: 50%;
transform:  translateX(-50%);
max-width: 150%;
width: 130%;
min-height:70em;
height: 110%;
background: radial-gradient(circle at 80% 40%, rgba(0, 0, 0, 0) 0%, rgba(206, 212, 0, 0.1) 15%, rgba(91, 93, 0, 0.3) 25%, rgba(0, 0, 0, 0.705)35%, rgba(0, 0, 0, 1) 90%, rgba(0, 0, 0, 1) 100%);
z-index: 1;
overflow: hidden;
animation: vaivenLuz 2.5s cubic-bezier(0.5, 0, 0.5, 1) infinite alternate;
}
@keyframes vaivenLuz {
  0% {
  transform: translateX(-48%) ;
}
100% {
  transform: translateX(-52%) ;
}
}

/* Estilos para la Luz */
.luz::before {
content: '';
position: initial;
top: -50%;
left: -50%;
transform: translateX(-50%);
width: 140%;
height: 110%;
background: radial-gradient(circle at 80% 40%, rgba(0, 0, 0, 0) 0%, rgba(206, 212, 0, 0.1) 15%, rgba(91, 93, 0, 0.3) 25%, rgba(0, 0, 0, 0.705)35%, rgba(0, 0, 0, 1) 90%, rgba(0, 0, 0, 1) 100%);
opacity: 0.8;
z-index: -2;
animation: tintineo 2s ease-in-out infinite alternate;
}
.lamp{
position:relative;
}

@keyframes tintineo {
0%, 100% {
  opacity: 0.8;
}
25%, 75% {
  opacity: 0.6;
}
50% {
  opacity: 0.4;
}
}
@keyframes subir{
0%{
  transform: translateY(0%);
}
100%{
  transform: translateY(-100%);
}
}
@keyframes desvanecer {
0%{
  opacity: 0.5;
}
100% {
  opacity: 0;
}
}
.luz.clicked {
display:none;
  animation: subir 0.5s ease-out forwards, desvanecer 0.5s ease-out forwards;
}
.lampara.clicked {
  animation: subir 0.5s ease-out forwards, desvanecer 0.5s ease-out forwards, vaivenLuz 2.5s cubic-bezier(0.5, 0, 0.5, 1) infinite alternate;
  transform-origin: top center;
  
}
  </style>