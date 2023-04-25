<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica, view.AppConfig"%>
<%
Sala salaAMostrar = (Sala) request.getAttribute("salaAMostrar");
String idSala = (String) request.getParameter("idSala");
boolean esSalaFisica = (boolean) request.getAttribute("esSalaFisica");
if (salaAMostrar == null) {
	response.sendRedirect("./salas?buscar=todas&m=todas&t=todas&d=todas");
}

String textoBoton = "Organizar partida";
String rutaImagenBoton = "./img_web/iconos_salas/Online.svg";
if (esSalaFisica == true) {
	textoBoton = "Realizar reserva";
	rutaImagenBoton = "./img_web/iconos_salas/Reserva.svg";
}
%>
<section id="wrapper_ver_sala">
	<div id="caja_ver_sala">
		<div id="caja_info">
			<div class="caja_subtitulo">
				<h2>Sinopsis</h2>
			</div>
			<div id="caja_sinopsis" class="cuerpo">
				<p><%=salaAMostrar.getDescripcion()%></p>

			</div>
			<div id="caja_etiquetas"></div>
			<%
			if (esSalaFisica == true) {
			%>
			<div id="caja_jugabilidad" class="cuerpo">
				<p>Esta es una sala física, por lo que funciona por medio de una
					reserva. ¡Puede seleccionar entre horarios disponibles y
					seleccionar la cantidad de participantes que acudirán a la sala!</p>
			</div>
			<div id="caja_reserva">
				<div id="caja_fecha">
					<label for="fecha_reserva">Fecha de la reserva:</label> <input
						type="date" id="fecha_reserva" name="fecha_reserva">
				</div>
				<div id="caja_numero_jugadores">
					<label for="num_jugadores">Número de jugadores que
						participarán:</label> <select id="num_jugadores" name="num_jugadores">
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
			<div id="caja_jugabilidad" class="cuerpo">
				<p>Esta es una sala online, por lo que puedes acceder a ella en
					cualquier momento, pero eso sí, asegúrate de traer a tus amigos
					para vencerla rápido, y por supuesto pasar unas buenas risas.
					Podrás invitar a tus amigos cuando estés organizando la partida.</p>
			</div>

			<%
			}
			%>

			<div id="caja_boton">
				<a href="" id="boton_reservar_organizar">
					<button>
						<div id="caja_icono">
							<img src=<%=rutaImagenBoton%>>
						</div>
						<p>
							<%=textoBoton%>
						</p>

					</button>
				</a>
			</div>
		</div>
		<div id="caja_img">
			<div id="caja_titulo">
				<h2><%=salaAMostrar.getNombre()%></h2>
			</div>
			<div class=caja_subtitulo"></div>
		</div>
	</div>

</section>

<style>
#wrapper_ver_sala {
	height: 100vh
}

#caja_ver_sala {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%
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

#caja_info h2 {
	text-align: center
}

#caja_img {
	background-image: url("./img_salas/portadas/<%=idSala%>.png");
	background-size: cover;
	text-align: center;
	height: 80%
}

#caja_boton {
	margin-top: 5%;
	font-size: 2em;
	display: flex;
	align-items: center;
	justify-content: center;
}

#boton_reservar_organizar {
	background-color: black;
	width: 50%;
}

#boton_reservar_organizar button {
	background-color: transparent;
	cursor: pointer;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	gap: 1%;
	width: 100%;
}

#caja_icono {
	display: flex;
	width: 20%;
}

#caja_boton p {
	width: 80%;
}

#caja_titulo {
	font-size: 2em;
	margin-top: 5%;
}

.caja_subtitulo {
	font-size: 2em;
	display: none;
}

.cuerpo {
	font-size: 2em;
}

a {
	
}
</style>