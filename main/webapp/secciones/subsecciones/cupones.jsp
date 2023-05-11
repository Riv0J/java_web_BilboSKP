<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="model.Suscriptor,  model.SalaOnline, java.time.*, model.Cupon, java.util.Vector, control.BilboSKP, view.Traductor, view.CookieHelper"%>
<link rel="stylesheet" href="css/EstilosCupones.css">
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
%>
<div id=cajaSubseccion>
	<div id="TextosEncabezado">
		<h1><%=Traductor.get(leng, "CU1")%></h1>
		<br>
		<p><%=Traductor.get(leng, "CU2")%> <a id="MisCuponesTitulo">
			<%=Traductor.get(leng, "CU3")%></a>
	</div>
	<form id="Cupones">


		<%
		Vector<Cupon> cupones = (Vector<Cupon>) request.getAttribute("cupones");
		System.out.println("Vector tiene un problema con cupones");
		// Recorre cada cupón en el ArrayList
		for (Cupon cupon : cupones) {
		%>
		<div class="fichaCupones">

			<img id="CuponImagen" src="./img_web/icons/couponWhite.png" width="40%" height="100px">
			<p class="CodigoCupon">
				<%=Traductor.get(leng, "CU4")%>
				<%=cupon.getEstado()%>
			</p>
			<p>
				<%=Traductor.get(leng, "CU5")%><br>
				<%=cupon.getFechaCaducidad()%></p>
			<p><%=cupon.getRembolsable()%></p>
			<% if(cupon.getRembolsable().equals("Reembolsable")){ %>
			<input id="botonRembolso" type="button" value="Reembolsar"
				onclick="alert('Tu cupón ha sido devuelto, espera un plazo maximo de una semana para recibir el importe en tu cuenta' )"></input>
			<% } %>
			
			<%
			%>
		</div>
		<%
		}
		%>
	</form>
</div>


