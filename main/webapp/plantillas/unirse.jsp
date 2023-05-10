<%@ page 
	import="view.Traductor,view.CookieHelper"%>
<%
String leng = CookieHelper.getLenguajeFromCookies(request.getCookies());
%>
<section id="caja_unirse">
		<form action="./unirse" method="get">
	        <div class="linea_unirse" id="linea_logo">
	            <h2><%=Traductor.get(leng, "UN1")%></h2>
	            <button id="boton_cerrar_unirse" type="button" >&times;</button>
	        </div>
	        <div class="linea_unirse">
	            <input type="text" min="1000" max="9999" maxlength="4" name="codInvitacion" placeholder="<%=Traductor.get(leng, "UN2")%>" required>
	        </div>
	        <div class="linea_unirse" id="linea_unirse_boton_submit">
	            <input class="bilboskp_submit" type="submit" value="<%=Traductor.get(leng, "UN3")%>">
	        </div>
	        <div class="linea_unirse" id="linea_extras">
	            <a href="index.jsp?sec=contacto#question4"> <li class="bilboskp_li" ><%=Traductor.get(leng, "UN4")%></li></a>
	        </div>
	    </form>
</section>
<script>
		document.querySelector("#boton_cerrar_unirse").addEventListener("click", function() {
			document.querySelector("#caja_unirse").style.display = "none";
		});
</script>
<style>
		#caja_unirse {
			z-index: 300;
		    display: none;
		    position: fixed;
		    width: 100%;
		    height: 75vh;
		    justify-content: center;
		    align-items: center;
		}
		#caja_unirse form{
		    background-color: #ffffff;
		    padding: 2%;
		    padding-bottom: 1%;
		    width: 30%;
		    height: fit-content;
		    position: relative;
		    border-radius: 1.5em;
		    z-index: 3000;
		}
        #caja_unirse h2{
            font-size: 1.75em;
            margin-top: 0;
        }
        #boton_cerrar_unirse {
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
        #boton_cerrar_unirse:hover{
            color: red;
        }
        .linea_unirse{
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			width: 100%;
			padding: 2%;
        }
        .linea_unirse a{
        	color: var(--bg-oscuro);
            font-style: italic;
		    font-size: 1.5em;
		    margin-bottom: 4%;
		    transition: all 0.3s ease-in-out;
        }
        #linea_logo{
        	padding-bottom: 5%;
        }
        #caja_unirse input{
        	font-size: 1.75em;
        }
        #linea_unirse_boton_submit{
            padding-top: 5%;
		    padding-bottom: 5%;
		    border-bottom: 0.25em solid var(--main-color);
        }
        #linea_extras{
            padding-top: 5%;
            padding-bottom: 0;
        }
        #caja_unirse input[type="text"]{
			width: 90%;
		    padding: 1%;
		    background-color: white;
		    outline: 0.15em solid gray;
		    border-radius: 0.2em;
		    padding-left: 2%;
		    padding-right: 2%;
		}
		@media (max-width: 1090px){
			#caja_unirse form{
				 width: 40%;
			}
		}
		@media (max-width: 800px){
			#caja_unirse form{
				 width: 60%;
			}
		}
		@media (max-width: 600px){
			#caja_unirse form{
				 width: 80%;
			}
		}
</style>