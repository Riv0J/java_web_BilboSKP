<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="model.Suscriptor,  model.SalaOnline, java.time.*, model.Cupon, java.util.Vector"%>
 	 <link rel="stylesheet" href="css/EstilosCupones.css"> 
<%
			%>

<section id="BodyCupones">
    <div id="TextosEncabezado">
        <Strong>Administrar cupones</Strong><br>
        <a id="MisCuponesTitulo">Mis cupones</a>
    </div>
    <form id="Cupones">
      
     
      <% 
        Vector<Cupon> cupones=(Vector<Cupon>)request.getAttribute("cupones");
        
        // Recorre cada cupón en el ArrayList
      for (Cupon cupon : cupones) {

      %>
       <div class="fichaCupones">
        <p class="CodigoCupon">Id Cupon: <%= cupon.getId() %></p>
        <p>Estado: <%= cupon.getEstado() %></p>
        <p>Fecha: <%= cupon.getFechaCaducidad() %></p>
       </div>
            <% 
        }
    %>
      

    </form>
    </section>



