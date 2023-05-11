
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="view.Mensaje, view.Icon, model.Suscriptor,view.Traductor,view.CookieHelper"%>
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
%>

<form id="form_subscribe" class="flex_center" action="./subscribe"
	method="post">
	<div id="caja_subscribe">
		<div id="caja_titulo" class="flex_center">
			<h2>
				<%=Traductor.get(leng, "SU1")%>
			</h2>
			<p><%=Traductor.get(leng, "SU2")%></p>
		</div>
		<div id="caja_inputs">
			<div class="bloque">
				<div class="linea_subscribe">
					<label for="alias">Alias:</label> <input type="text" id="alias"
						name="alias" required>
				</div>
				<div class="linea_subscribe">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" required>
				</div>
				<div class="linea_subscribe">
					<label for="pass"><%=Traductor.get(leng, "SU3")%></label> <input
						type="password" id="pass" name="pass" required>
				</div>
				<div class="linea_subscribe">
					<label for="pass2"><%=Traductor.get(leng, "SU4")%></label> <input
						type="password" id="pass2" name="pass2" required>
				</div>
			</div>
			<div class="bloque">
				<div class="linea_subscribe">
					<label for="nombre"><%=Traductor.get(leng, "SU5")%></label> <input
						type="text" id="nombre" name="nombre" required>
				</div>
				<div class="linea_subscribe">
					<label for="apellidos"><%=Traductor.get(leng, "SU6")%></label> <input
						type="text" id="apellidos" name="apellidos" required>
				</div>
				<div class="linea_subscribe">
					<label for="fecha_nacimiento"><%=Traductor.get(leng, "SU7")%></label>
					<input type="date" id="fecha_nacimiento" name="fech_nac" required>
				</div>
				<div class="linea_subscribe">
					<label for="telefono"><%=Traductor.get(leng, "SU8")%></label> <input
						type="tel" id="telefono" name="telefono" required>
				</div>
			</div>
		</div>
		<div id="caja_boton" class="flex_center">
			<button id="boton_subscribe" class="bilboskp_icon_button">
				<i class="<%=Icon.getIconHTMLClass("reserva")%>"></i>
				<div>
					<%=Traductor.get(leng, "SU9")%>
				</div>
			</button>
		</div>
	</div>
</form>
<style>
#form_subscribe {
	height: 95vh;
	width: 100%;
	/*background-color: var(--bg-oscuro);*/
	background-size: contain;
	background-repeat: no-repeat;
	background-image: linear-gradient(90deg, rgba(0, 0, 0, 0.6) 10%,
		rgba(0, 0, 0, 1) 75%, rgba(0, 0, 0, 1) 80%, rgba(0, 0, 0, 1) 100%),
		url(img_web/subscribe/pasillo2.png);
}

#caja_subscribe {
	width: 60%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	padding-bottom: 5%;
}

#caja_inputs {
	width: 100%;
	display: flex;
	flex-direction: row;
	font-size: 1.75em;
}

.bloque {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

.linea_subscribe {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-bottom: 3%;
}

.linea_subscribe>* {
	width: 80%;
	padding: 2%;
	border-radius: 0.5em;
	color: whitesmoke;
}

label {
	color: var(- -text-color);
	font-size: 1 -5em;
}
.linea_subscribe input{
	color: black;
}
#caja_boton {
	padding-top: 5%;
	width: 100%;
	font-size: 1.3em;
}

#boton_subscribe {
	width: 22%;
	padding: 1%;
}

#caja_titulo {
	width: 100%;
	font-size: 2em;
	text-align: center;
	color: whitesmoke;
	padding: 2%;
	letter-spacing: 0.1em;
	display: flex;
	flex-direction: column;
}

#caja_titulo p {
	font-size: 0.75em;
	margin-top: 2%;
}
</style>
