<form id="form_subscribe" action="./subscribe" method="post">
	<div id="caja_subscribe">
		<div id="caja_inputs">
			<div class="bloque">
				<div class="linea_subscribe">
					<label for="email">Email:</label>
					<input type="email" id="email" name="email" required>
				</div>
				<div class="linea_subscribe">
					<label for="pass">Contraseña:</label>
				  	<input type="password" id="pass" name="pass" required>
				</div>
				<div class="linea_subscribe">
					<label for="alias">Alias:</label>
			  		<input type="text" id="alias" name="alias" required>
				</div>
			</div>
			<div class="bloque">
				<div class="linea_subscribe">
					<label for="nombre">Nombre:</label>
					<input type="text" id="nombre" name="nombre" required>
				</div>
				<div class="linea_subscribe">
				 	<label for="apellidos">Apellidos:</label>
			  		<input type="text" id="apellidos" name="apellidos" required>
				</div>
				<div class="linea_subscribe">
					<label for="fecha_nacimiento">Fecha de nacimiento:</label>
			  		<input type="date" id="fecha_nacimiento" name="fech_nac" required>
				</div>
				<div id="linea_subscribe">
					<label for="telefono">Teléfono:</label>
			 		<input type="tel" id="telefono" name="telefono" required>
				</div>
			</div>
		</div>
		<div id="caja_boton">
			<input class="bilboskp_input" type="submit" value="Enviar">
		</div>
  </div>
</form>
<style>
  #form_subscribe {
  	width: 100%;
  	background-color: var(--bg-oscuro);
  }
  #caja_subscribe{
  	width:95%;
 	
  }
  #caja_inputs{
  	width: 100%;
  	display:flex;
  	flex-direction: row;
  }
  .bloque{
  	width: 35%;
  }
  .linea_subscribe{
  	display: flex;
  	flex-direction: column;
  	justify-content: center;
  	align-items: center;
  }
  .linea_subscribe > *{
  	width: 80%;
  }
  label {
    color: var(--text-color);
  }
</style>
