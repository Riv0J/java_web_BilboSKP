<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contacto/Preguntas frecuentes</title>
</head>
<body>
	<div id="contacto">
		<h2>Contacto</h2>
		<ul>
			<li><a href='#'
				onclick="document.getElementById('mapa').style.display='block'">
					Dirección</a>
				<div id="mapa" style="display: none;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d863.815857621014!2d-2.9399132027993353!3d43.261511918187765!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4e502873b41fd5%3A0x1ab0ace3022b6ab9!2sCentro%20San%20Luis%20-%20Formaci%C3%B3n%20Profesional%20y%20Bachillerato!5e0!3m2!1ses!2ses!4v1681988811679!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapa').style.display='none'">Cerrar
						mapa</button>
				</div></li>
			<li>Telefono: 944BS7831 <img
				src="../img_web/icons/llamada-telefonica.png" alt=""></li>

		</ul>
	</div>
	<div id="redesSociales">
		<h2>Redes sociales</h2>
		<ul>
			<li>Twitter</li>
			<li>Facebook</li>
			<li>WhatsApp</li>
			<li>Instagram</li>
		</ul>
	</div>
	<div id="FAQ">
		<h2>Preguntas frecuentes</h2>
		<ul>
			<li>¿Como comprar cupones?</li>
			<li>¿Como organizo una partida?</li>
			<li>¿Cuanto tarda en caducar un cupón?</li>
			<li>¿Que pasa si se termina el tiempo en una sala?</li>
			<li>¿Como sé cuan dificil es una sala?</li>
		</ul>
	</div>
	<div id="otrasConsultas">
		<h2>Otras consultas de utilidad</h2>
		<ul>
			<li><p>
					Vienes en coche y quieres encontrar un <a href="#"
						onclick="document.getElementById('mapaParking').style.display='block'">PARKING</a>?
				</p>
				<div id="mapaParking" style="display: none">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d11622.056460142625!2d-2.9420943393433077!3d43.261604061391125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sparking!5e0!3m2!1ses!2ses!4v1681987223931!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapaParking').style.display='none'">Cerrar
						mapa</button>

				</div></li>
			<li>¿Las paradas de <a href='#'
				onclick="document.getElementById('mapaMetro').style.display='block'">
					Metro</a> mas cercanas?
				<div id="mapaMetro" style="display: none;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d9494.583303045854!2d-2.943192228933983!3d43.26253759019211!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1smetro!5e0!3m2!1ses!2ses!4v1681988362771!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapaMetro').style.display='none'">Cerrar
						mapa</button>
				</div>
			</li>
		</ul>
	</div>
	<div id="formulario">
		<h2>
			¿Tienes alguna otra consulta que hacernos?<br>
		</h2>
		<form method="get">
			<textarea cols="60" rows="5" placeholder="Escribe tu duda aquí"></textarea>
			<button name="submit" type="submit">Enviar</button>
			<button type="reset">Borrar</button>



		</form>
	</div>
	<style>
img {
	width: 40px;
	height: 40px;
}
</style>
</body>
</html>