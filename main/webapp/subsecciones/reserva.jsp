<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/reserva.css">
<title>Mis reservas</title>
</head>
<body>
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
</body>
</html>