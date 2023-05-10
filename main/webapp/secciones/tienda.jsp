<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.Cupon, model.Suscriptor,view.CookieHelper, view.Traductor" %>
<%String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
%>
<div class="background">
	<link rel="stylesheet" href="./css/tienda.css">

	<form name="formComprar" class="formComprar"
		action="./tienda?accion=comprar" method="get">
		<input type="hidden" name="accion" value="comprar">

		<div class="cajaComprar">
			<h2><%=Traductor.get(leng,"Tcomprar")%></h2>
			<p><%=Traductor.get(leng,"TcomprarText")%></p>
			<fieldset class="comprar">
				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3><%=Traductor.get(leng,"Tcupon1")%></h3>
					<h5><%=Traductor.get(leng,"Tdescuento1")%></h5>

					<button name="cantidad" class="botonCompra" type="submit" value="1"><%=Traductor.get(leng,"TcomprarYa")%></button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3><%=Traductor.get(leng,"Tcupon3")%></h3>
					<h5><%=Traductor.get(leng,"Tdescuento3")%></h5>
					<button name="cantidad" class="botonCompra" type="submit" value="3"><%=Traductor.get(leng,"TcomprarYa")%></button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">
					<h3><%=Traductor.get(leng,"Tcupon5")%></h3>
					<h5><%=Traductor.get(leng,"Tdescuento5")%></h5>
					<button name="cantidad" class="botonCompra" type="submit" value="5"><%=Traductor.get(leng,"TcomprarYa")%></button>

				</div>

				<div class="cajaCupon">
					<img src="./img_web/icons/couponWhite.png" width="40%"
						height="100px">

					<h3><%=Traductor.get(leng,"Tcupon7")%></h3>
					<h5><%=Traductor.get(leng,"Tdescuento7")%></h5>
					<button name="cantidad" class="botonCompra" type="submit" value="7"><%=Traductor.get(leng,"TcomprarYa")%></button>

				</div>
		</div>
		</fieldset>
	</form>
	<form name="formRegalar" class="formRegalar" action="./tienda"
		method="get">
		<input type="hidden" name="accion" value="regalar">

		<fieldset class="regalar">
			<div class="cajaRegalar">
				<%=Traductor.get(leng,"Tregalar")%>
				<h4>
				<%=Traductor.get(leng,"TregalarText")%>
				</h4>
				<input name="email" class="email" type="email"
					placeholder="<%=Traductor.get(leng,"Temail")%>"> 
				<select name="cantidad" id="cantidad" class="bilboskp_select">
					<option value="selecciona"><%=Traductor.get(leng,"Toferta")%></option>
					<option value="1"><%=Traductor.get(leng,"Tcupon1")%></option>
					<option value="3"><%=Traductor.get(leng,"Tcupon3")%></option>
					<option value="5"><%=Traductor.get(leng,"Tcupon5")%></option>
					<option value="7"><%=Traductor.get(leng,"Tcupon7")%></option>
				</select> <br>
				<button class="botonRegalar" type="submit"><%=Traductor.get(leng,"TregalarBoton")%></button>
			</div>
		</fieldset>
	</form>
</div>
