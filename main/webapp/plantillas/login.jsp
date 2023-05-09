<section id="caja_login">
		<form action="./login" method="post">
	        <div class="linea_login" id="linea_logo">
	            <h2>Iniciar sesión</h2>
	            <button id="boton_cerrar_login" type="button" >&times;</button>
	        </div>
	        <div class="linea_login">
	            <input type="text" name="email" placeholder="Correo electrónico" required>
	        </div>
	        <div class="linea_login">
	            <input type="password" name="pass" placeholder="Contraseña" required>
	        </div>
	        <div class="linea_login" id="linea_login_boton_submit">
	            <input class="bilboskp_submit" type="submit" value="Iniciar sesión">
	        </div>
	        <div class="linea_login" id="linea_extras">
	            <a href="index.jsp?sec=subscribe"> <li class="bilboskp_li" >No estoy suscrito</li></a>
	            <!-- <a href="index.jsp?sec=subscribe"> <li class="bilboskp_li" >Olvidé mi contraseña</li></a>-->
	        </div>
	    </form>
</section>
	<style>
		#caja_login {
			z-index: 300;
		    display: none;
		    position: fixed;
		    width: 100%;
		    height: 75vh;
		    justify-content: center;
		    align-items: center;
		}
		#caja_login form{
		    background-color: #ffffff;
		    padding: 2%;
		    padding-bottom: 1%;
		    width: 25%;
		    height: fit-content;
		    position: relative;
		    border-radius: 1.5em;
		    z-index: 3000;
		}
        #caja_login h2{
            font-size: 2em;
            margin-top: 0;
        }
        #boton_cerrar_login {
		    position: absolute;
			top: 1%;
			right: 2%;
			padding-bottom: 0.5%;
			padding-left: 1.5%;
			padding-right: 1.5%;
			font-size: 1em;
			border: none;
			background: none;
			cursor: pointer;
			transition: all 0.15s ease-in-out;
			color: black;
			width: fit-content;
			font-size: 5em;
		}
        #boton_cerrar_login:hover{
            color: red;
        }
        .linea_login{
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			width: 100%;
			padding: 2%;
			  padding-bottom: 2%;
			padding-bottom: 8%;
        }
        .linea_login a{
        	color: var(--bg-oscuro);
            font-style: italic;
		    font-size: 1.5em;
		    margin-bottom: 4%;
		    transition: all 0.3s ease-in-out;
        }
        #linea_logo{
        	padding-bottom: 5%;
        }
        #caja_login input{
        	font-size: 1.75em;
        }
        #linea_login_boton_submit{
            padding-top: 5%;
		    padding-bottom: 5%;
		    border-bottom: 0.25em solid var(--main-color);
        }
        #linea_extras{
            padding-top: 5%;
            padding-bottom: 0;
        }
        #caja_login input[type="text"],
		#caja_login input[type="password"] {
			width: 90%;
		    padding: 1%;
		    background-color: white;
		    outline: 0.15em solid gray;
		    border-radius: 0.2em;
		    padding-left: 2%;
		    padding-right: 2%;
		}
		#caja_login input[type="submit"] {
		}
		@media (max-width: 1090px){
			#caja_login form{
				 width: 40%;
			}
		}
		@media (max-width: 800px){
			#caja_login form{
				 width: 60%;
			}
		}
		@media (max-width: 600px){
			#caja_login form{
				 width: 80%;
			}
		}
	</style>