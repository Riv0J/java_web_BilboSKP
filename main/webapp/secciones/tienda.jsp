<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Cupon"%>

<div class="background">
	<link rel="stylesheet" href="./css/tienda.css">

	<form name="formComprar" action="./tienda" method="get">

		<div class="cajaComprar">
			<h2>Comprar cupones</h2>
			<p>Cada cupón te servirá para organizar una partida en la sala de
				escape que tu prefieras.</p>
			<fieldset class="comprar">
				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3>1 cupón</h3>
					<h5>5% de descuento</h5>

					<button name="tienda" class="botonCompra" type="submit">Comprar
						ya<%String tienda = "comprar"; %></button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3>3 cupones</h3>
					<h5>11% de descuento</h5>
					<button name="comprar3" class="botonCompra" type="submit">Comprar
						ya</button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3>5 cupones</h3>
					<h5>17% de descuento</h5>
					<button name="comprar5" class="botonCompra" type="submit">Comprar
						ya</button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">

					<h3>7 cupones</h3>
					<h5>25% de descuento</h5>
					<button name="comprar7" class="botonCompra" type="submit">Comprar
						ya</button>

				</div>
		</div>
		</fieldset>
	</form>
	<form name="formRegalar" action="./tienda" method="get">

		<fieldset class="regalar">
			<div class="cajaRegalar">
				<h2>Regalar cupones</h2>
				<h4>
					Quieres regalar un cupón? Introduce los datos del <em><strong>suscriptor</strong></em>
					al que quieras mandarle el regalo.
				</h4>
				<input name="email" type="email"
					placeholder="Email del destinatario"> <select
					name="cantidad" id="cantidad">
					<option value="selecciona">Selecciona oferta</option>
					<option value="1">1 cupón</option>
					<option value="3">3 cupones</option>
					<option value="5">5 cupones</option>
					<option value="7">7 cupones</option>
				</select> <br>
				<button name="regalar" class="botonRegalar" type="submit">Regalar
					cupón</button>
			</div>
		</fieldset>
	</form>
</div>
