<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Suscriptor, view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date"%>

<link rel="stylesheet" href="css/gestionCuenta.css">
<%
HttpSession sesion = request.getSession();
Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor");
sesion.setAttribute("sus", sus);
%>

<div class="caja2">
                <div class="parte1">
                    <h2>Gestión de la cuenta</h2>
                    <p>Modifica aquí tus datos personales. Recuerda que tanto como el alias, nombre y apellidos
                    pertenecen a tu perfil público.</p>
                </div>
                <form action="">
                    <div class="subcaja1">
                   		<img src="img_suscriptores/<%=sus.getImagen()%>" alt="">
                   		<div class="boton_modificar">
                   		<input class="modificar" type="" value="">
                   		</div>
                    </div>
                    <div class="form1">
                        <div class="box0">
                            <label for=""><strong>Nombre:</strong></label>
                            <div class="edit">
                                <input type="text" name="" id="" value="<%=sus.getNombre()%>">
                                <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div>
                        <div class="box0">
                            <label for="">Apellido:</label>
                            <div class="edit">
                                <input type="text" name="" id="" value="<%=sus.getApellidos()%>">
                            	<img src="img_web/icons/edit_icon.png" alt="">	
                            </div>
                        </div>
                    </div>
                    <div class="form2">
                        <div class="box0">
                            <label for="">Email:</label>
                            <div class="edit">
                                <input type="email" name="" id="" value="<%=sus.getEmail()%>">
                                <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                            
                        </div>
                        <div class="box0">
                            <label for="">Alias:</label>
                            <div class="edit">
                                <input type="text" name="" id="" value="<%=sus.getAlias()%>">
                               <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="form3">
                        <div class="box0">
                            <label for="">Fecha de nacimiento</label>
                            <div class="edit">
                                <input type="date" name="" id="" value="">
                                <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div>
                        <div class="box0">
                            <label for="">Télefono:</label>
                            <div class="edit">
                                <input type="text" name="" id="" value="<%=sus.getTelefono()%>">
                                <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div>
                    </div>
                    <%--
                    <div class="form4">
                        <div class="box0">
                            <label for="">Contraseña</label>
                            <div class="edit">
                                <input type="password" name="" id="">
                                <img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div>
                        <div class="box0">
                            <label for="">Télefono:</label>
                            <div class="edit">
                                <input type="text" name="" id="">
                               	<img src="img_web/icons/edit_icon.png" alt="">
                            </div>
                        </div> 
                        
                    </div>--%>
                    <div class="form5">
                        <input type="button" value="Guardar cambios">
                    </div>
                </form>
                <!--<form class="caja4">
                    <h2>Cambiar contraseña</h2>
                    <div class="box1">
                        <label for="">Introduce la contraseña actual </label>
                        <input type="password" name="" id="">
                    </div>
                    <div class="box1">
                        <label for="">Introduce la nueva contraseña</label>
                        <input type="password" name="" id="">
                    </div>
                    <div class="box1">
                        <label for="">Repite la nueva contraseña</label>
                        <input type="password" name="" id="">
                    </div>
                </form>-->
                <div class="caja3">
                    <h2>¿Deseas darte de baja?</h2>
                    <p>Al darte de baja se perderán tus avances y en caso de tener cupones no canjeados
                        se te hará un reembolso</p>
                    <input type="button" value="Darse de baja"></a>
                </div>
</div>
    
  

