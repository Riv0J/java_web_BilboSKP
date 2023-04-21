<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.HashMap,  model.Sala, model.PartidaOnline, model.Partida"%>
	<%
HashMap<String, Sala> mapaSalas = (HashMap<String, Sala>) request.getAttribute("mapaSalas");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ranking</title>
</head>
<body>
	<h2 class="superior">Sala de escape: *En nombre de la proteina*</h2>
	<nav class="lateral">
	<% //TODO %>
		sala 1<br>sala 2
	</nav>
	<div id="podio">
		<div class="info">
			<img src="../img_web/icons/copa2.png">
			<div class="caja plata">
				<p>
					Grupo 2<br> 1350 puntos<br> 2023-02-17
				</p>
			</div>
		</div>
		<div class="info">
			<img src="../img_web/icons/copa1.png">
			<div class="caja oro">
				<p>
					Grupo 1<br> 1500 puntos <br> 2023-02-13
				</p>
			</div>
		</div>
		<div class="info">
			<img src="../img_web/icons/copa3.png">
			<div class="caja bronce">
				<p>
					Grupo 3<br> 1250 puntos<br> 2023-02-19
				</p>
			</div>
		</div>
	</div>
	<div id="finalistas">
		<ol>
			<li value="4">Grupo 4</li>
			<li>Grupo 5</li>
			<li>Grupo 6</li>
			<li>Grupo 7</li>
			<li>Grupo 8</li>
			<li>Grupo 9</li>
		</ol>
	</div>




	<style>
.info {
	width: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

img {
	width: 80px;
	height: 80px;
}

p {
	width: 100%;
	text-align: center;
}

.superior {
	width: 80%;
	height: 2em;
	margin-right: 5%;
	float: right;
	display: flex;
	justify-content: center;
	border: #000 solid 1px;
}

.lateral {
	width: 16%;
	height: 500px;
	float: left;
	margin-left: 3%;
	margin-top: 4%;
	border: #000 solid 1px;
}

#podio {
	display: flex;
	/*  align-content: center;*/
	align-items: flex-end;
	width: 65%;
	height: 22em;
	margin-left: 25%;
	border: #000 solid 1px;
}

.oro {
	display: flex;
	justify-content: center;
	border: 3px solid #ffd700;
	height: 12em;
	width: 10em;
	padding: 0 auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.plata {
	display: flex;
	justify-content: center;
	border: 3px solid #C0C0C0;
	height: 10em;
	width: 10em;
	margin: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.bronce {
	display: flex;
	justify-content: center;
	border: 3px solid #CD7F32;
	height: 8em;
	width: 10em;
	margin: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

#finalistas {
	margin-left: 20%;
	border: #000 solid 1px;
}

li {
	margin: 1px;
	border: #000 solid 1px;
}
</style>
</body>
</html>