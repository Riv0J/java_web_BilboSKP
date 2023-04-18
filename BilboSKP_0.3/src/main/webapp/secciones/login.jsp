<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background: #f5f5f5;
		}

		.container {
			display: flex;
			height: 100vh;
			align-items: center;
			justify-content: center;
		}

		.form-container {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			padding: 40px;
			background-color: #fff;
			border-radius: 20px;
			box-shadow: 0 0 10px rgba(0,0,0,0.2);
			flex-basis: 50%;
			margin: 20px;
		}

		.form-container h2 {
			margin-bottom: 20px;
			color: #333;
			text-transform: uppercase;
			font-size: 24px;
			font-weight: 700;
			letter-spacing: 2px;
			text-align: center;
		}

		form {
			display: flex;
			flex-direction: column;
			width: 100%;
		}

		label {
			font-size: 16px;
			font-weight: 600;
			color: #555;
			margin-bottom: 5px;
		}

		input[type="text"], input[type="email"], input[type="password"], input[type="name"] {
			padding: 10px;
			margin-bottom: 20px;
			border: none;
			border-radius: 5px;
			box-shadow: 0 0 5px rgba(0,0,0,0.2);
			font-size: 16px;
			font-family: Arial, sans-serif;
		}

		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			font-family: Arial, sans-serif;
			cursor: pointer;
			transition: background-color 0.2s ease-in-out;
		}

		input[type="submit"]:hover {
			background-color: #3e8e41;
		}

		.line {
			height: 100%;
			width: 1px;
			background-color: #ccc;
		}

		@media screen and (max-width: 768px) {
			.container {
				flex-direction: column;
			}

			.form-container {
				flex-basis: 100%;
				margin: 10px 20px;
			}

			.line {
				display: none;
			}
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="form-container">
			<h2>Iniciar Sesión</h2>
			<form>
				<label for="username">Usuario:</label>
				<input type="text" id="username" name="username" required>

				<label for="password">Contraseña:</label>
				<input type="password" id="password" name="password" required>

				<input type="submit" value="Iniciar Sesión">
			</form>
		</div>
		<div class="line"></div>
		<div class="form-container">
			<h2>Registrarse</h2>
			<form action="./login" method="POST">
				<label for="nombre">Nombre:</label>
                <input type="nombre" id="nombre" name="nombre" required>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
        
                    <label for="pass">Contraseña:</label>
                    <input type="pass" id="pass" name="pass" required>
        
                    <input type="submit" value="Registrarse">
                </form>
            </div>
        </div>
      </body>
</html>
