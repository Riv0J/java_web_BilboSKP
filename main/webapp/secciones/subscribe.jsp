<style>
  body {
    background-color: white;
  }
  form {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f2f2f2;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  }
  label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
  }
  input[type="text"],
  input[type="email"],
  input[type="password"],
  input[type="tel"],
  input[type="date"] {
    padding: 10px;
    width: 100%;
    margin-bottom: 20px;
    border-radius: 5px;
    border: none;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
  }
  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  input[type="submit"]:hover {
    background-color: #3e8e41;
  }
</style>

<form action="/subscribe" method="post">
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>

  <label for="pass">Contraseña:</label>
  <input type="password" id="pass" name="pass" required>

  <label for="alias">Alias:</label>
  <input type="text" id="alias" name="alias" required>

  <label for="telefono">Teléfono:</label>
  <input type="tel" id="telefono" name="telefono" required>

  <label for="nombre">Nombre:</label>
  <input type="text" id="nombre" name="nombre" required>

  <label for="apellidos">Apellidos:</label>
  <input type="text" id="apellidos" name="apellidos" required>

  <label for="fecha_nacimiento">Fecha de nacimiento:</label>
  <input type="date" id="fecha_nacimiento" name="fech_nac" required>

  <input type="submit" value="Enviar">
</form>
