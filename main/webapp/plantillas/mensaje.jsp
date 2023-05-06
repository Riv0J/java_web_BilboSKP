<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Suscriptor, view.Mensaje"%>
<%
Object mensaje = (Object) request.getAttribute("mensaje");
if (mensaje instanceof Mensaje) {
	String mensajeTexto = ((Mensaje) mensaje).texto;
%>
<section id="caja_mensaje">
	<div>
		<i></i><%=mensajeTexto%>
	</div>
</section>
<script>
	document.querySelector("#boton_cerrar_mensaje").addEventListener("click", function() {
		document.querySelector("#caja_mensaje").style.display = "none";
	});
</script>
<%
}
%>