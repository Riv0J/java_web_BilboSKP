<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Cupon"%>

<body>
	<link rel="stylesheet" href="../css/tienda.css">

	<form method="get">
		<h2>Comprar cupones</h2>
		<div id="cajaComprar">
			<fieldset class="comprar">
				<div class="cajaCupon">
					<img src="../img_web/icons/coupon.png" width="40%" height="100px">
					<h3>1 cupon</h3>
					<h5>5% de descuento</h5>
					<div class>
						<button name="comprar1" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/coupon.png" width="40%" height="100px">
						<h3>3 cupones</h3>
						<h5>11% de descuento</h5>
						<div id="root"></div>
						<button name="comprar3" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/coupon.png" width="40%" height="100px">
						<h3>5 cupones</h3>
						<h5>17% de descuento</h5>
						<div id="root"></div>
						<button name="comprar5" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/coupon.png" width="40%" height="100px">

						<h3>7 cupones</h3>
						<h5>25% de descuento</h5>
						<div id="root"></div>
						<button name="comprar7" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>
				</div>
			</fieldset>
			<fieldset class="regalar">
				<div class="cajaRegalar">
					<h4>
						Quieres regalar un cupón? Introduce los datos del <strong>suscriptor</strong>
						al que quieras mandarle el regalo.
					</h4>
					<input name="alias" type="text" placeholder="Alias"> 
					<input name="email" type="email" placeholder="Email del destinatario">
                    <select name="cantidad" id="cantidad">
                      <option value="selecciona">Selecciona oferta</option>
                      <option value="1">1 cupón</option>
                      <option value="3">3 cupones</option>
                      <option value="5">5 cupones</option>
                      <option value="7">7 cupones</option>
                      </select>

					<button name="regalar" class="botonRegalar" type="submit">Regalar
						cupón</button>
				</div>
			</fieldset>
	</form>
</body>
</html>