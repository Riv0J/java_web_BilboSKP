<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String seccion = request.getParameter("sec");
String rutaJspSeccion = "";
if (seccion == null) {
	seccion = "inicio";
}
rutaJspSeccion = "secciones/" + seccion + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=seccion.substring(0, 1).toUpperCase() + seccion.substring(1)%> | BilboSKP</title>
<link rel="stylesheet" jref="css/colores.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/bilboskp-icon.css">
<link rel="stylesheet" href="css/header.css">
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
<link rel="icon" type="image/x-icon" href="img_web/logos/500x400-cuadrado-2.png">
</head>
<body>
	<%--<%@include file="plantillas/nav.jsp"--%>
	<jsp:include page="css/colores.jsp"></jsp:include>
	<header>
		<div id=caja_logo>
			<a id="logo_grande" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/500x200-logo-rojo-2.png"></a>
			<a id="logo_peque" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/500x400-cuadrado-2.png"></a>
		</div>

		<ul class="navbar">
			<a href="./salas?buscar=todas&m=todas&t=todas&d=todas"><li>Salas
					de escape</li></a>
			<a href="./ranking"><li>Ranking</li></a>
			<a href="./tienda"><li>Tienda</li></a>
			<a href="./salas"><li>Unirse a partida</li></a>
			<a href="./contacto+FAQ"><li>Contacto</li></a>
		</ul>
		<div class="main">
			<a href="./perfil" class="user"><i class="ri-user-fill"></i>Sing
				In</a> <a href="/subscribe" class="suscribirse">Subscribe</a>
			<div class="bx bx-menu" id="menu-icon"></div>
		</div>
		<script type="text/javascript" src="js/script.js"></script>
	</header>
	<main>
		<%-- <jsp:include page="plantillas/mensaje.jsp"></jsp:include>--%>
		<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
	</main>
	<footer>
        <section id="caja1">
            <div class="box">
                <ul>
                    <li> <a href="">Site map</a></li>
                    <li> <a href="">Privacidad</a></li>
                    <li> <a href="">Cookies</a></li>
                </ul>
            </div>
            <div class="box1">
                <img src="img_web/logos/500x200-logo-rojo-2.png" alt="">
            </div>
            <div class="box">
                <ul>
                    <li><a href="">Contáctanos</a></li>
                    <li><a href="">Redes</a></li>
                    <li><a href="">FAQ</a></li>
                </ul>
            </div>
        </section>
        <section id="caja2">
            <ul>
                <li>©BilboSKP 2022-2023</li>
            </ul>
        </section>
    </footer>
</body>
</html>
