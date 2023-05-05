<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Cupon"%>

<body>
	<link rel="stylesheet" href="../css/tienda.css">

	<form name="formCupones" method="get">
		
		<div class="cajaComprar">
            <h2>Comprar cupones</h2>
			<fieldset class="comprar">
				<div class="cajaCupon">
						<img src="../img_web/icons/couponWhite.png" width="40%" height="100px">
					<h3>1 cupón</h3>
					<h5>5% de descuento</h5>
					
						<button name="comprar1" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/couponWhite.png" width="40%" height="100px">
						<h3>3 cupones</h3>
						<h5>11% de descuento</h5>
						<button name="comprar3" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/couponWhite.png" width="40%" height="100px">
						<h3>5 cupones</h3>
						<h5>17% de descuento</h5>
						<button name="comprar5" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>

					<div class="cajaCupon">
						<img src="../img_web/icons/couponWhite.png" width="40%" height="100px">

						<h3>7 cupones</h3>
						<h5>25% de descuento</h5>
						<button name="comprar7" class="botonCompra" type="submit">Comprar
							ya</button>

					</div>
				</div>
			</fieldset>
			<fieldset class="regalar">
				<div class="cajaRegalar">
                    <h2>Regalar cupones</h2>
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
                      <br>
					<button name="regalar" class="botonRegalar" type="submit">Regalar
						cupón</button>
				</div>
			</fieldset>
	</form>
</body>
</html>