    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="view.Mensaje, view.Icon, model.Suscriptor"%>
<%
String seccion = request.getParameter("sec");
Object mensaje = (Object) session.getAttribute("mensaje");
Object mostrarLogin = (Object) session.getAttribute("mostrarLogin");
Object sus = (Object) session.getAttribute("suscriptor");
boolean mostrarVentanaLogin = false;
Mensaje mostrarMensaje = null;
if(mostrarLogin instanceof String){
	session.setAttribute("mostrarLogin", null);
	mostrarVentanaLogin = true;
}
if(mensaje instanceof Mensaje){
	session.setAttribute("mensaje", null);
	mostrarMensaje = (Mensaje) mensaje;
}

if (seccion == null) {
	seccion = "inicio";
}

String rutaJspSeccion = "secciones/" + seccion + ".jsp";
String tituloPagina = seccion.substring(0, 1).toUpperCase() + seccion.substring(1) + " | BilboSKP";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><%=tituloPagina%></title>
	<link rel="stylesheet" href="css/colores.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/bilboskp.css">
	<link rel="stylesheet" href="css/header.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&display=swap" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="img_web/logos/500x400-cuadrado-2.png">
</head>
<body>
	<%--<%@include file="plantillas/nav.jsp"--%>
	<jsp:include page="css/colores.jsp"></jsp:include>
	<header>
		<div id=caja_logo>
			<a id="logo_grande" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/logo-bilboskp-es.png"></a>
			<a id="logo_peque" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/500x400-cuadrado-2.png"></a>
		</div>
	
		<ul class="navbar">
			<a href="./salas?buscar=todas&m=todas&t=todas&d=todas"><li>Salas de escape</li></a>
			<a href="./ranking"><li>Ranking</li></a>
			<a href="./tienda"><li>Tienda</li></a>
			<!--  <a href="./salas"><li>Unirse a partida</li></a>-->
			<a href="./contacto+FAQ"><li>Contacto</li></a>
		</ul>
		<div class="main">
			<% if(sus instanceof Suscriptor){ Suscriptor suscriptor = (Suscriptor) sus; %>
				<a href="./perfil" class="user" id="botonPerfil"><i class="<%=Icon.getIconHTMLClass("user-fill")%>"></i> <%=suscriptor.getAlias() %></a>
				<a href="./logout" class="suscribirse"><i class="<%=Icon.getIconHTMLClass("logout")%>" style="font-size: 1.65em;"></i></a>
							
			<% } else { %>
				<a class="user" id="botonPerfil"><i class="ri-user-fill"></i>Sign in</a> 
				<a href="index.jsp?sec=subscribe" class="suscribirse">Subscribe</a>
			<% } %>
			<div class="bx bx-menu" id="menu-icon"></div>
		</div>
		<script type="text/javascript" src="js/script.js"></script>
	</header>
	<main>
		<%-- <jsp:include page="plantillas/mensaje.jsp"></jsp:include>--%>
		<jsp:include page="plantillas/login.jsp"></jsp:include>
		<% if (mostrarMensaje!=null){
			//System.out.println("Mostrando mensaje en el index");%>
			<jsp:include page="plantillas/mensaje.jsp"></jsp:include>
		<% }%>
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
            <div class=caja_logo>
				<a id="logo_grande" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/logo-bilboskp-es.png"></a>
				<a id="logo_peque" href="./index.jsp?sec=inicio" class="logo"> <img  src="img_web/logos/500x400-cuadrado-2.png"></a>
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
<% if(mostrarVentanaLogin == true){
	//System.out.println("Mostrando la ventana de login"); %>
	<style>
		#caja_login{
			display: flex;
		}
	</style>
<% } %>
<script>
	var cajaLogin = document.querySelector("#caja_login");
	var botonPerfil = document.getElementById("botonPerfil");
	var botonCerrarLogin = document.getElementById("boton_cerrar_login");
	var cajaUnirse = document.querySelector("#caja_unirse");
	
	function toggleLogin() {
	  if (cajaLogin.style.display === "flex") {
		 cajaLogin.style.display = "none";
		 cajaUnirse.style.display = "noflexne";
	  } else if (cajaLogin.style.display === "none") {
	    cajaLogin.style.display = "flex";
	    cajaUnirse.style.display = "none";
	  } else {
	    cajaLogin.style.display = "flex";
	    cajaUnirse.style.display = "none";
	  }
	}
	
	botonPerfil.addEventListener("click", toggleLogin);
	botonCerrarLogin.addEventListener("click", toggleLogin);
</script>
</html>
