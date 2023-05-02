<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Reserva, view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date  "%>
    
<link rel="stylesheet" href="../css/reserva.css">
<main>
        <section id="caja1">
            <h1>Administra tus reservas</h1>
            <p>Puedes ver o cancelar tus reservas o volver a reservar facilmente</p>
            <div class="historial">
                <h2>Próximas reservas</h2>
            </div>
        </section>
        <section id="caja2">
            <div class="subcaja">
                <div class="cajita">
                    <label for=""><strong>Reserva</strong></label>
                    <p>Nombre de la sala de escape</p>
                    <p>Temática</p>
                    <p>Duración</p>
                    <p>Número de jugadores</p>
                </div>
                <div class="cajita"><label for=""> <strong>Número reserva</strong></label></div>
                <div class="cajita"><label for=""> <strong>Fecha</strong></label></div>
                <div class="cajita"><label for=""> <strong>Hora</strong></label></div>
                <div class="cajita"><label for=""> <strong>Dirección</strong></label></div>
                <div class="cajita"><label for=""> <strong>Estado</strong></label></div>
            </div>
            <div class="subcaja1">
                <input type="button" value="Cancelar reserva">
            </div>
        </section>

    </main>

