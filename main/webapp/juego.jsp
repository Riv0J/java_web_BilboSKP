<%@ page
	import="java.util.Vector, java.util.HashMap, java.util.Map, model.Flecha,java.util.Date, model.Escenario, 
	model.Sala, model.SalaOnline, model.Chat, model.Invitado, model.Anfitrion, model.Jugador, view.StringHelper, view.DateHelper, view.Icon, model.PartidaOnline, model.Suscriptor"%>
<%
PartidaOnline partidaOnline = (PartidaOnline) request.getAttribute("partidaOnline");
Escenario escenarioAMostrar = (Escenario) request.getAttribute("escenarioAMostrar");
if (partidaOnline == null) {
	response.sendRedirect("index.jsp");
	System.out.println("NO hay partida en el request");
}
System.out.println(partidaOnline.getCodInvitacion());
System.out.println(escenarioAMostrar.getImagen());
Vector<Chat> lineasChat = partidaOnline.getLineasChat();

//obtener el escenario
//obtener el array de los objetos
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Juego | BilboSKP</title>
	<link rel="stylesheet" href="css/juego.css">
	<link rel="stylesheet" href="css/colores.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/bilboskp.css">
	<link
		href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&display=swap"
		rel="stylesheet">
	<link rel="icon" type="image/x-icon"
		href="img_web/logos/500x400-cuadrado-2.png">
</head>
<body>
	<main>
		<section id=interfaz>
			<div id="menu">
				<h1 id="temporizador">00:00</h1>
				<a id="Ajustes"></a> <a id="Pistas"></a>
			</div>

			<form id="chat">
				<div id="caja_mensajes"></div>
				<input type="text" id="mensaje" placeholder="Escribe un mensaje">
				<input type="submit" value="Enviar">
			</form>
			<div id="MenuInventario">
				<a id="BotonInventario"></a>
			</div>
			<div id="FondoInventario">
				<div class="objeto">
					<img src="img_salas/juego/cuadrado.png">
				</div>
			</div>
		</section>
		<section id="Escenario">
			<div class="flecha"></div>
			<div class="objeto"></div>
		</section>
	</main>
</body>
</html>