<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="model.Suscriptor,  model.SalaOnline, java.time.*, model.Cupon, java.util.Vector"%>
 	 <link rel="stylesheet" href="css/EstilosCupones.css"> 
<%
			%>
<div id=cajaSubseccion>
    <div id="TextosEncabezado">
        <h1>Administrar cupones</h1><br>
        <p>Aqui podras encontrar nuestro propio sistema economico,
        los cupones. Con un cupón puedes organizar una partida y
        jugar con tus amigos las aventuras que hemos creado para ti.
        <a id="MisCuponesTitulo">Mis cupones</a>
    </div>
    <form id="Cupones">
      
     
      <% 
        Vector<Cupon> cupones=(Vector<Cupon>)request.getAttribute("cupones");
        System.out.println("Vector tiene un problema con cupones");
        // Recorre cada cupón en el ArrayList
    for (Cupon cupon : cupones) {
		
      %>
       <div class="fichaCupones">
        <p class="CodigoCupon">Estado: <%= cupon.getEstado() %> </p>
        <p><%= cupon.getRembolsable() %></p>
        <p>Fecha caducidad:<br> <%= cupon.getFechaCaducidad() %></p>
       </div>
            
       <% } %>
      

    </form>
</div>


