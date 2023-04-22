<div class="caja_desplegable" id="caja_desplegable_modalidad">
	<div class="caja_boton_desplegable">
		<div class="caja_radio_seleccionado" id="texto_opcion_seleccionada">
			<i class=""></i> Todas las modalidades
		</div>
		<div class="caja_flecha">
			<img src="./img_web/iconos_salas/ArrowDown.svg">
		</div>
	</div>

	<div class="caja_opciones">
		<div class="opcion caja_opcion">
			<input type="radio" name="modalidades" value="todas"
				id="modalidades_todas"><label for="modalidades_todas">Todas
				las modalidades</label>
		</div>
		<div class="opcion caja_opcion">
			<input type="radio" name="modalidades" value="online"
				id="modalidades_online"> <i class="bilboskp-icon icon-online"></i><label for="modalidades_online">Salas
				Online</label>
		</div>
		<div class="opcion caja_opcion">
			<input type="radio" name="modalidades" value="fisicas"
				id="modalidades_fisicas"> <i class="bilboskp-icon icon-reserva"></i><label for="modalidades_fisicas">Salas
				Físicas</label>
		</div>
	</div>
</div>

<style>
.caja_desplegable {
	position: relative;
	width: 16%;
	display: none;
}

.caja_boton_desplegable {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	position: relative;
	z-index: 0;
	background-color: wheat;
	cursor: pointer;
}

.caja_flecha {
	width: 15%;
}

.caja_opciones {
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	background-color: wheat;
	display: none;
}

.caja_opciones.activo {
	display: block;
}

.caja_opcion {
	padding: 2%;
}

.caja_opcion:hover {
	background-color: #6fbfff;
	color: #fff;
}

.caja_opcion input[type="radio"] {
	display: none;
}

.caja_radio_seleccionado {
	width: 85%;
	text-align: center;
}

.caja_radio_seleccionado i {
	margin-right: 5px;
}
</style>
<script>
var botonDesplegable = document
.getElementById("caja_desplegable_modalidad");
var cajaOpciones = botonDesplegable.getElementsByClassName("caja_opciones")[0];
var inputModalidades = document.getElementById("inputModalidades");

botonDesplegable.addEventListener("click", function(event) {
event.stopPropagation();
cajaOpciones.classList.toggle("activo");
});

document.addEventListener("click", function(event) {
if (event.target != botonDesplegable) {
cajaOpciones.classList.remove("activo");
}
});

var opciones = cajaOpciones.getElementsByClassName("opcion");

for (var i = 0; i < opciones.length; i++) {
opciones[i].addEventListener("click", function() {
var textoSeleccionado = this.querySelector("label").textContent;
inputModalidades.value = this.querySelector("input").value;
document.getElementById("texto_opcion_seleccionada").innerHTML = this.innerHTML;
cajaOpciones.classList.remove("activo");
});
}

</script>
