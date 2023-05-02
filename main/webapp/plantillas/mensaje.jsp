 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Suscriptor, view.Mensaje"%>
<% Mensaje mensaje =(Mensaje) request.getAttribute("mensaje");%>
<section id="caja_menasje">
		<div>
		<i></i><%= mensaje.texto%>
		</div>
		<style>
		#caja_mensaje{
		z-index:100000000000000000;
		font-size:4em;
		}
		</style>
</section>
	<script>
		document.querySelector("#boton_cerrar_mensaje").addEventListener("click", function() {
			document.querySelector("#caja_mensaje").style.display = "none";
		});
	</script>
	