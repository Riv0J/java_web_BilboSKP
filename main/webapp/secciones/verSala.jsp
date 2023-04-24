<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Sala, model.SalaOnline, model.SalaFisica, view.AppConfig"%>
<% 
Sala salaAMostrar = (Sala) request.getAttribute("salaAMostrar");
boolean esSalaFisica = (boolean) request.getAttribute("esSalaFisica");
if (salaAMostrar==null) {
	response.sendRedirect("./salas?buscar=todas&m=todas&t=todas&d=todas");
}

String textoBoton = "Organizar partida";
if (esSalaFisica == true){
	textoBoton = "Realizar reserva";
}
%>
<section id="wrapper_ver_sala">
	<div id="caja_ver_sala">
		<div id="caja_info">
			<div class="caja_subtitulo">
				<h2>Sinopsis</h2>
			</div>
			<div id="caja_sinopsis">
				<p><%=salaAMostrar.getDescripcion()%></p>

			</div>
			<div id="caja_etiquetas">
			</div>
			<div id="caja_jugabilidad">
				<p>Las salas online, se pueden jugar....</p>
			</div>
			<% 
			if(esSalaFisica==true){
				%>
				<div id="caja_reserva">
				<label for="fecha_reserva">Fecha de reserva:</label> 
				<input
					type="date" id="fecha_reserva" name="fecha_reserva">
				</div>
			<% }
			
			%>
			
			<div id="caja_boton">
				<label for="fecha_reserva"></label> 
					<input type="date" id="fecha_reserva" name="fecha_reserva">
				<a href="">
					<button id="boton_reservar_organizar">
						<div>
							<img src=""> 
							</img>
						</div>
						<%=textoBoton%>
					</button>
				</a>
			</div>
		</div>
	</div>
	<div id="caja_img">
		<div id=caja_titulo"></div>
		<div class=caja_subtitulo"></div>
	</div>
</section>