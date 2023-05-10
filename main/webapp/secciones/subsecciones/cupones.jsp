<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="model.Suscriptor,  model.SalaOnline, java.time.*, model.Cupon, java.util.Vector, control.BilboSKP"%>
<link rel="stylesheet" href="css/EstilosCupones.css">
<%

%>
<div id=cajaSubseccion>
	<div id="TextosEncabezado">
		<h1>Administrar cupones</h1>
		<br>
		<p>
			Aquí podrás encontrar nuestro propio sistema económico, los cupones.
			Con un cupón puedes organizar una partida y jugar con tus amigos las
			aventuras que hemos creado para ti. <a id="MisCuponesTitulo">Mis
				cupones</a>
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
				Estado:
				<%=cupon.getEstado()%>
			</p>
			<p>
				Fecha caducidad:<br>
				<%=cupon.getFechaCaducidad()%></p>
			<p><%=cupon.getRembolsable()%></p>
			<input id="botonRembolso" type="button" value="Reembolsar"
				onclick="alert('Tu cupón ha sido devuelto, espera un plazo maximo de una semana para recibir el importe en tu cuenta' )">
			<%
			int idElminarCupon = cupon.getId();

			//BilboSKP.eliminarCupon(idElminarCupon);
			%></input>
		</div>



		<%
		}
		%>


	</form>
</div>


