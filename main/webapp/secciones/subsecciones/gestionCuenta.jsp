<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Suscriptor,view.Traductor,view.CookieHelper, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date"%>

<link rel="stylesheet" href="css/gestionCuenta.css">
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
HttpSession sesion = request.getSession();
Suscriptor sus= (Suscriptor) sesion.getAttribute("suscriptor");
sesion.setAttribute("sus", sus);
%>

<div class="caja2">
                <div class="parte1">
                    <h2><%=Traductor.get(leng, "GC1")%></h2>
                    <p><%=Traductor.get(leng, "GC2")%></p>
                </div>
                <form action="./perfil" method="post">
                    <div class="subcaja1">
                   		<img src="img_suscriptores/<%=sus.getImagen()%>" alt="">                   	
                    </div>
                    <div class="form1">
                        <div class="box0">
                            <label for=""><strong><%=Traductor.get(leng, "GC3")%></strong></label>
                            <div class="edit">
                                <input type="text" name="nombre" id="nombre" value="<%=sus.getNombre()%>">
                              	<%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
                            </div>
                        </div>
                        <div class="box0">
                            <label for=""><%=Traductor.get(leng, "GC4")%></label>
                            <div class="edit">
                                <input type="text" name="apellido" id="apellido" value="<%=sus.getApellidos()%>">
                            	<%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
                            </div>
                        </div>
                    </div>
                    <div class="form2">
                        <div class="box0">
                            <label for="">Email:</label>
                            <div class="edit">
                                <input type="email" name="email" id="email" value="<%=sus.getEmail()%>">
                                <%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
                            </div>
                            
                        </div>
                        <div class="box0">
                            <label for="">Alias:</label>
                            <div class="edit">
                                <input type="text" name="alias" id="alias" value="<%=sus.getAlias()%>">
                              <%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
                            </div>
                        </div>
                    </div>
                    <div class="form3">
                        <div class="box0">
                            <label for=""><%=Traductor.get(leng, "GC9")%></label>
                            <div class="edit">
                                <input type="date" name="fecha_nacimiento" id="fecha_nacimiento" value="<%=sus.getFech_nac()%>">
                                <%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
                            </div>
                        </div>
                        <div class="box0">
                            <label for=""><%=Traductor.get(leng, "GC5")%></label>
                            <div class="edit">
                                <input type="text" name="telefono" id="telefono" value="<%=sus.getTelefono()%>">
                                <%--  <img src="img_web/icons/edit_icon.png" alt="">--%> 
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
                     	<input type="submit" value="Guardar cambios"> 
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
                    <h2><%=Traductor.get(leng, "GC6")%></h2>
                    <p><%=Traductor.get(leng, "GC7")%></p>
                 	<div class="interruptor">
                 		<p><%=Traductor.get(leng, "GC8")%></p>
                 		<label class="switch">
  							<input type="checkbox">
  							<span class="slider round"></span>
						</label>
                 	
                 	</div>
                  	
               
				</div>
    
  

