<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Reserva, model.Sala,  view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date, java.util.Vector "%>  
	
<link rel="stylesheet" href="css/reserva.css">	
	
<div class="caja2">
			<section id="cajita1">
                <h1>Administra tus reservas</h1>
                <p>Puedes ver o cancelar tus reservas para las salas de escape f�sicas.Ten en cuenta que tus reservas se mostrar�n por orden
                de fecha de caducidad m�s cercana.</p>
                
                
            </section>
            
<% 
        Vector<Reserva> reservas=(Vector<Reserva>)request.getAttribute("reservas");
        // Recorre cada cup�n en el ArrayList
    for (Reserva reserva : reservas) {
    	SalaFisica sf= (SalaFisica) Sala.getSalaPorId("SF"+reserva.getIdSalaFisica());
    	
		    	%>           
            <section id="cajita2">
                <div id="subcaja2">
                    <ul class="menu">
                        <div class="menu1">
                            <li>Informaci�n reserva</li>
                        </div>
                        <div class="menu3">
                            <li>N�reserva</li>
                        </div>
                        <div class="menu3">
                         <li>Fecha y hora</li>
                        </div>
                        <div class="menu3">
                            <li>Estado</li>
                        </div>   
                    </ul>
                </div>
                <div class="subcaja3">
                    <div class="info1"> 
                        <div class="cajita">
                            <label for="">Sala de escape:</label>
                            <p><%=sf.getNombre() %></p>
                        </div>
                        <div class="cajita">
                            <label for="">T�matica:</label>
                          <p><%=sf.getTematica() %></p>
                        </div>
                        <div class="cajita">
                            <label for="">Duraci�n:</label>
                            <p><%=sf.getTiempoMax()%> minutos</p>
                        </div>
                        <div class="cajita">
                            <label for="">N� jugadores:</label>
                             <p><%=reserva.getNumJugadores()%> jugadores</p>
                        </div>
                    </div>
                    <div class="info">
                       <p><%=reserva.getIdReserva()%></p>
                       <p><%=reserva.getFechaHora() %></p>
                       <p><%=reserva.getEstado()%></p>
                    </div>
                </div>
            </section>
            <section id="caja4">
                <div class="subcaja4">
                    <input type="button" value="Cancelar reserva" onclick="alert(Tu reserva ha sido cancelada)">
                </div>
            </section>

</div>  

 <% } %>