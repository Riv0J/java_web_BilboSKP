<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="model.Suscriptor,  model.SalaOnline, java.time.*, model.Cupon, java.util.ArrayList"%>

<%			LocalDate fechaCupon = LocalDate.of(2023, 4, 28);
			java.util.Date fechaDate = java.util.Date.from(fechaCupon.atStartOfDay(ZoneId.systemDefault()).toInstant());

			Cupon c= new Cupon(1, "Activo", fechaDate);
			ArrayList <Cupon> cupones=new ArrayList<Cupon>();
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			cupones.add(c);
			
			%>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/gestionCuenta.css">
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cupones</title>
  <link rel="stylesheet" href="../css/EstilosCupones.css"> 
</head>
<body>
  <main>
    <div id="TextosEncabezado">
        <a>Administrar cupones</a><br>
        <a id="MisCuponesTitulo">Mis cupones</a>
    </div>
    <form id="Cupones">
      
     
      <% 
        
        
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
  </main>
</body>
</html>

