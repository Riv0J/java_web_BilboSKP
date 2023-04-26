<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Suscriptor, view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig"%>
<!DOCTYPE html>
<% Suscriptor sus= new Suscriptor(1, 1234, "hola@gmail,com" , "pau", "paula", "castillo", "imagen", 1 , null);%>

<link rel="stylesheet" href="../css/perfil.css">
<main>
       <section>
            <div class="caja1">
                <h1>Mi perfil</h1>
                <ul>
                    <li class="gc"><a href="perfil.jsp">Gestión de la cuenta</a></li>
                    <li><a href="misReservas.jsp">Mis reservas</a></li>
                    <li><a href="misCupones.jsp">Mis cupones</a></li>
                    <li><a href="ajustesCuenta.jsp">Cerrar sesión</a></li>
                </ul>
            </div>
            <div class="caja2">
                <div>
                    <h2>Gestión de la cuenta</h2>
                    <p>Modifica aquí tus datos personales.Tanto el alias como tu nombre y apellido se mostrarán en tu perfil público.
                </div>
                <form action="">
                    <div class="subcaja1">
                        <img src="../img_web/icons/user.png" alt="">
                        <input type="button" value="Modificar"/>
                    </div>
                    <div class="form1">
                        <div class="box0">
                            <label for="">Nombre:</label>
                            <input type="text" name="" id="" value="<%=sus.getNombre()%>">
                        </div>
                        <div class="box0">
                            <label for="">Apellido:</label>
                            <input type="text" name="" id="" value="<%=sus.getApellidos()%>">
                     	</div>
                    </div>
                    <div class="form2">
                        <div class="box0">
                            <label for="">Email:</label>
                            <input type="email" name="" id="" value="<%=sus.getEmail()%>">
                        </div>
                         <div class="box0">
                            <label for="">Alias</label>
                            <input type="text" name="" id="" value="<%=sus.getAlias()%>">
                        </div>
                    </div>
                    <div class="form3">
                        <div class="box0">
                            <label for="">Fecha de nacimiento</label>
                            <input type="date" name="" id="" value="">
                        </div>
                        <div class="box0">
                            <label for="">Télefono:</label>
                            <input type="" name="" id="" value="<%=sus.getTelefono()%>">
                        </div>
                    </div>
                    <div class="subcaja3">
                        <input type="button"  value="Guardar" <% %>/> 
                    </div>
                </form>
            </div>
        </section>
        <div class="caja3">
            <h2>¿Deseas darte de baja?</h2>
            <p>Al darte de baja se perderán tus avances y en caso de tener cupones no canjeados
            se te hará un reembolso</p>
            <a href="darseBaja.jsp"><input type="button" value="Darse de baja"></a>
        </div>
    </main>

