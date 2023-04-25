<%@ page language="java" import="view.Frases, java.util.HashMap"%>
<%
Frases frase=new Frases();

%>

<div class="cajagrande">
	<div class="caja contacto">
		<h2><%=Frases.getFrase("ESContactocontacto") %></h2>
		<ul>
			<li><img src="../img_web/icons/directions.png" alt=""><span><a
					href='#'
					onclick="document.getElementById('mapa').style.display='block'">
						<%=Frases.getFrase("ESContactoDireccion")%></a></span>
				<div id="mapa" style="display: none;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d863.815857621014!2d-2.9399132027993353!3d43.261511918187765!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4e502873b41fd5%3A0x1ab0ace3022b6ab9!2sCentro%20San%20Luis%20-%20Formaci%C3%B3n%20Profesional%20y%20Bachillerato!5e0!3m2!1ses!2ses!4v1681988811679!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapa').style.display='none'"><%=Frases.getFrase("ESContactoBotonCerrar")%>
						</button>
				</div></li>
			<li><img src="../img_web/icons/llamada-telefonica.png" alt=""><%=Frases.getFrase("ESContactoTelefono")%>:
				944BS7831</li>

		</ul>
	</div>
	<div class="caja redesSociales">
		<h2><%=Frases.getFrase("ESContactoRedes")%></h2>
		<ul>
			<li><img src="../img_web/icons/twitter.png" alt=""><a
				href="https://twitter.com" target="_blank">Twitter</a></li>
			<li><img src="../img_web/icons/facebook.png" alt=""><a
				href="https://facebook.com" target="_blank">Facebook</a></li>
			<li><img src="../img_web/icons/whatsapp.png" alt=""><a
				href="https://chat.whatsapp.com/IPaleWYDzwPLNyOMBpNr4q"
				target="_blank">WhatsApp</a></li>
			<li><img src="../img_web/icons/instagram.png" alt=""><a
				href="https://instagram.com" target="_blank">Instagram</a></li>
		</ul>
	</div>
</div>
<div class="cajagrande">
	<div class="caja FAQ">
		<h2><%=Frases.getFrase("ESContactoFAQ")%></h2>
		<ul class="acordeon">
			<li><a href='#'><%=Frases.getFrase("ESContactoFAQ1")%></a>
				<ul>
					<li><%=Frases.getFrase("ESContactoFAQ1R")%></li>
				</ul></li>
			<li><a href='#'><%=Frases.getFrase("ESContactoFAQ2")%></a>
				<ul>
					<li><%=Frases.getFrase("ESContactoFAQ2R")%></li>
				</ul></li>
			<li><a href='#'><%=Frases.getFrase("ESContactoFAQ3")%></a>
				<ul>
					<li><%=Frases.getFrase("ESContactoFAQ3R")%></li>
				</ul></li>
			<li><a href='#'><%=Frases.getFrase("ESContactoFAQ4")%></a>
				<ul>
					<li><%=Frases.getFrase("ESContactoFAQ4R")%></li>
				</ul></li>
			<li><a href='#'><%=Frases.getFrase("ESContactoFAQ5")%></a>
				<ul>
					<li><%=Frases.getFrase("ESContactoFAQ5R")%></li>

				</ul></li>
		</ul>
	</div>
	<div class="caja otrasConsultas">
		<h2><%=Frases.getFrase("ESContactoOtras")%></h2>
		<ul>
			<li><p>
					<img src="../img_web/icons/parking.png" alt=""><span><a href="#"
						onclick="document.getElementById('mapaParking').style.display='block'"><%=Frases.getFrase("ESContactoParking")%></a></span>?
				</p>
				<div id="mapaParking" style="display: none">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d11622.056460142625!2d-2.9420943393433077!3d43.261604061391125!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sparking!5e0!3m2!1ses!2ses!4v1681987223931!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapaParking').style.display='none'"><%=Frases.getFrase("ESContactoBotonCerrar")%></button>

				</div></li>
			<li><img src="../img_web/icons/metro.png" alt=""><span> <a href='#'
					onclick="document.getElementById('mapaMetro').style.display='block'"><%=Frases.getFrase("ESContactoMetro")%></a></span>
				<div id="mapaMetro" style="display: none;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d9494.583303045854!2d-2.943192228933983!3d43.26253759019211!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1smetro!5e0!3m2!1ses!2ses!4v1681988362771!5m2!1ses!2ses"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					<button
						onclick="document.getElementById('mapaMetro').style.display='none'"><%=Frases.getFrase("ESContactoBotonCerrar")%></button>
				</div></li>
		</ul>
	</div>
</div>
<div id="formulario">
	<h2>
		<%=Frases.getFrase("ESContactoOtraConsulta")%><br>
	</h2>
	<form method="get">
		<textarea cols="60" rows="5" placeholder="<%=Frases.getFrase("ESContactoTextarea")%>"></textarea>
		<br>
		<button name="submit" type="submit"><%=Frases.getFrase("ESContactoEnviar")%></button>
		<button type="reset"><%=Frases.getFrase("ESContactoBorrar")%></button>



	</form>
</div>
<style>
#formulario form {
	text-align: center;
}

#formulario button {
	display: inline-block;
	margin: 10px;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.redesSociales {
	font-size: larger;
}

img {
	width: 40px;
	height: 40px;
	margin-right: 3%;
	margin-bottom: 2%;
}

span {
	font-size: larger;
}

.caja {
	/*border: #000 solid 1px;*/
	width: 45%;
	margin: 0 auto;
}

.cajagrande {
	width: 75%;
	/*border: #971b1b solid 1px;*/
	display: flex;
	justify-content: space-evenly;
}

.caja h2 {
	text-align: center;
}

.caja ul li {
	list-style: none;
}

/*Estilos acordeon FAQ*/
ul.acordeon, ul.acordeon * {
	margin: 0;
	padding: 0;
	border: 0;
}

ul.acordeon {
	margin: 10px auto;
	padding: 0;
	list-style: none;
	width: 100%;
	font-size: 18px;
}

ul.acordeon li {
	list-style: none;
}

ul.acordeon li a {
	display: block;
	padding: 10px 10px 10px 20px;
	background: #333;
	color: #eee;
	border-bottom: 1px solid #000;
	border-top: 1px solid #666;
	text-decoration: none;
	box-sizing: border-box;
}

ul.acordeon li ul {
	max-height: 0;
	margin: 0;
	padding: 0;
	list-style: none;
	overflow: hidden;
	transition: .3s all ease-in;
}

ul.acordeon li li a {
	padding: 10px 10px 10px 40px;
	background: #999;
	color: #000;
	font-size: 16px;
	border: 0;
	border-bottom: 1px solid #ccc;
	box-sizing: border-box;
}

ul.acorc li li:last-child a {
	border-bottom: 0;
}

ul.acordeon li:hover ul {
	max-height: 300px;
	transition: .3s all ease-in;
}

ul.acordeon li a:hover {
	background: #666;
	color: #fff;
}
</style>
