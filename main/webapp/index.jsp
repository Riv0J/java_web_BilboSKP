


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String seccion = request.getParameter("sec");
if (seccion == null) {
	seccion = "inicio";
}
seccion = "secciones/" + seccion + ".jsp";
%>
<!DOCTYPE html>
<html>
<Style>
#ColorPrincipal {
	color: #29fd53; /*verde*/
	color: #353535; /*muy gris*/
	color: #303136; /*gris*/
}
</Style>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BilboSKP</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/bilboskp-icon.css">
<link rel="icon" type="image/x-icon" href="img/favicon.png">
</head>
<body>
	<%--<%@include file="plantillas/nav.jsp"--%>
	<header>
		<ul>
			<a href="./salas?buscar=todas&m=todas&t=todas&d=todas">
				<li><div class="bilboskp-icon">&#xe804;</div>Salas de escape</li>
			</a>
			<a href="./ranking">
				<li>Ranking</li>
			</a>
			<a href="./tienda">
				<li>Tienda</li>
			</a>
			<a href="./perfil">
				<li>Mi perfil</li>
			</a>
			<a href="./salas">
				<li>Unirse a una partida</li>
			</a>
			<a href="./contacto+FAQ">
				<li>Contacto</li>
			</a>

		</ul>
	</header>
	<main>
		<%-- <jsp:include page="plantillas/mensaje.jsp"></jsp:include>--%>

		<jsp:include page="<%=seccion%>"></jsp:include>
	</main>
</body>
</html>
