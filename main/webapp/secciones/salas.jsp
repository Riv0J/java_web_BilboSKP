<%@ page
	import="java.util.HashMap, java.util.Map, model.Sala, model.SalaOnline, model.SalaFisica"%>
<%
HashMap<String, Sala> mapaSalas = (HashMap<String, Sala>) request.getAttribute("mapaSalas");
%>

<link rel="stylesheet" href="css/salas.css">
<section id="contenedor_salas">
	<div id=contenedor_salas_wrapper>
		<%
		if (mapaSalas == null || mapaSalas.size() == 0) {
		%>
		<article class="caja_sala">
			<div class="caja_img">
				<img src="img_salas/portadas/1.png" alt="Imagen de la sala">
			</div>
			<div class="caja_titulo">
				<h2>No se encontraron salas, por favor inténtalo de nuevo</h2>
			</div>
			<div class="caja_organizar">
				<button>
					<a href="./salas">Reintentar</a>
				</button>
			</div>
		</article>
		<%
		} else {
		for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			Sala sala = par.getValue();
			String idSala = par.getKey();
			String nombreSala = sala.getNombre();
			String textoBoton = "Organizar partida";
			String enlaceBoton = "./organizar?id=" + idSala;
			String modalidad = "Online";
			if (sala instanceof SalaFisica) {
				textoBoton = "Realizar Reserva";
				enlaceBoton = "./reservar?id=" + idSala;
				modalidad = "Reserva";
			}
		%>
		<article class="caja_sala">
			<div class="caja_img">
				<img src="img_salas/portadas/<%=par.getKey()%>.png" alt="Portada">
			</div>
			<div class="caja_titulo">
				<h2><%=nombreSala%></h2>
			</div>
			<div class="caja_sinopsis">
				<p><%=sala.getDescripcion()%></p>
			</div>
			<div class="caja_etiquetas">
				<div class="etiqueta jugadores">
					<div>
						<img class="icon" src="img_web/icons/user.svg" alt="Jugadores:">
						<div><%=sala.getJugadoresMin() %>-<%=sala.getJugadoresMax() %></div>
					</div>
				</div>
				<div class="etiqueta dificultad">
					<div>
						<img class="icon" src="img_web/icons/lock.svg" alt="Dificultad:">
						<div><%=sala.getDificultad() %></div>
					</div>
				</div>
				<div class="etiqueta tiempo">
					<div>
						<img class="icon" src="img_web/icons/clock.svg" alt="Tiempo:">
						<div><%=sala.getTiempoMax() %>'</div>
					</div>
				</div>

				<div class="etiqueta tematica">
					<div>
						<img class="icon" src="img_web/icons/<%=sala.getTematica() %>.svg" alt="Tematica:">
						<div><%=sala.getTematica() %></div>
					</div>
				</div>
				<div class="etiqueta modalidad">
					<div>
						<img class="icon" src="img_web/icons/<%=modalidad %>.svg" alt="Modo">
						<div><%=modalidad %></div>
					</div>
				</div>
			</div>
			<div class="caja_organizar">
				<button>
					<a href=<%=enlaceBoton%>>Ver más</a>
				</button>
			</div>
		</article>

		<%
		}
		}
		%>
	
</section>