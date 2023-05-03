<%

String subseccion = request.getParameter("sub");
if (subseccion == null)  {
	response.sendRedirect("./perfil");
}
String rutaJspSeccion = "subsecciones/" + subseccion + ".jsp";
System.out.println(rutaJspSeccion);
%>

<link rel="stylesheet" href="css/perfil.css">

<div id="caja0">
            <div class="caja1">
            	<h1>Mi perfil</h1>
                <ul>


                    <li class="gc"><a href="./perfil?sub=gestionCuenta">Gestión de la cuenta</a></li>
                    <li><a href="./perfil?sub=reserva">Mis reservas</a></li>
                    <li><a href="./perfil?sub=cupones">Mis cupones</a></li>

                    <li><a href="./perfil?sec=inicio"></a></li>
                </ul>
            </div>
            <div class="caja2">
            	<jsp:include page="<%=rutaJspSeccion%>"></jsp:include>
            </div>
</div>



		


