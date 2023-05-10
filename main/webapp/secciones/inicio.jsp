
<%@ page
	import="view.Traductor, model.Suscriptor, model.SalaOnline, control.BilboSKP, view.Mensaje, java.util.Vector, java.io.File, view.CookieHelper"%>
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
session.setAttribute("urlPrevia", "index.jsp");
//System.out.println("JSP Inicio establecida url previa = index.jsp");
Vector<SalaOnline> vectorSalasMasJugadas = new Vector<SalaOnline>();
try {
	vectorSalasMasJugadas = BilboSKP.getSalasMasJugadas(3);
} catch (Throwable e) {
	e.printStackTrace();
}
%>
<link rel="stylesheet" href="css/inicio.css">
<main>
	<div class="lamp">
		<div class="lampara" id="lampara"></div>
		<div class="luz" id="luz"></div>
	</div>
	<jsp:include page="../plantillas/unirse.jsp"></jsp:include>
	<section class="principal">
		<div id="caja_principal">
		
			<h1 class="bilbosk_h1"><%=Traductor.get(leng, "inicio1")%></h1>
			<p class="bilboskp_p"><%=Traductor.get(leng, "inicio2")%></p>
			<div class="flex_center">
				<a class="flex_center" href="./salas"><button
						class="bilboskp_icon_button"><%=Traductor.get(leng, "inicio3")%></button></a> <a
					class="flex_center" href="#"><button id="boton_unirse"
						class="bilboskp_icon_button_inverted"><%=Traductor.get(leng, "inicio4")%></button></a>
			</div>
		</div>
		<div class="llave">
			<img src="img_web/inicio/llave.png" alt="">
		</div>
	</section>

	<section class="caja_titulo">
		<h2 class="bilbosk_h2"><%=Traductor.get(leng, "inicio5")%></h2>
	</section>
	<section class="card-container">
		<%
		for (SalaOnline so : vectorSalasMasJugadas) {
			String rutaImagenPortada = "img_salas/portadas/SO" + so.getIdSala() + ".png";
			File archivoImagenPortada = new File(getServletContext().getRealPath("/") + rutaImagenPortada);
			if (!archivoImagenPortada.exists()) {
				rutaImagenPortada = "img_salas/portadas/Question.png";
			}
		%>
		<div class="card">
			<img src="<%=rutaImagenPortada%>" alt="Foto Scape room">
			<div class="card-content">
				<h2><%=so.getNombre()%></h2>
				<p><%=so.getDescripcion()%></p>
			</div>
		</div>
		<%
		}
		%>
	</section>
	<section class="caja_titulo caja_textura">
		<h2 class="bilbosk_h2"><%=Traductor.get(leng, "inicio6")%></h2>
	</section>
	<section class="card-container2">
		<div class="card">
			<img src="img_web/inicio/multijugador.png" alt="Foto del scape room">
			<div class="card-content">
				<h2><%=Traductor.get(leng, "inicio7")%></h2>
				<p><%=Traductor.get(leng, "inicio8")%></p>
			</div>
		</div>
		<div class="card">
			<img src="img_web/inicio/senal.png" alt="Foto del scape room">
			<div class="card-content">
				<h2><%=Traductor.get(leng, "inicio9")%></h2>
				<p><%=Traductor.get(leng, "inicio10")%></p>
			</div>
		</div>
		<div class="card">
			<img src="img_web/inicio/innovacion.png" alt="Foto del scape room">
			<div class="card-content">
				<h2><%=Traductor.get(leng, "inicio11")%></h2>
				<p><%=Traductor.get(leng, "inicio12")%></p>
			</div>
		</div>
	</section>
</main>
<script>
	/*script para unirse*/
	document.querySelector("#boton_unirse").addEventListener("click",
			function() {
				document.querySelector("#caja_unirse").style.display = "flex";
				document.querySelector("#caja_login").style.display = "none";
			});
	/*script para lampara*/
	document.querySelector('.luz').addEventListener('click', function() {
		this.classList.add('clicked');
		lampara.classList.add('clicked');
	});
</script>
<style> 

</style>