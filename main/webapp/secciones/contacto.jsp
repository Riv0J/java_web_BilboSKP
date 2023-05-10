<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Suscriptor, view.Frases, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date"%>
<link rel="stylesheet" href="css/contacto.css">

<main>
        <div class="cajatexto1">
            <h1>Aquí nos tienes ¿Hablamos?</h1>
        </div>
        <section id="sec_1">
            <div class="cajagrande">
                <div class="contacto">
                    <div class="brand">
                        <img src="img_web/icons/logo1.png" alt="">
                    </div>
                    <div class="contacto1">
                        <div class="caja_info">
                            <img src="img_web/icons/telefono.png" alt="">
                            <p>902435352</p>
                        </div>
                        <div class="caja_info">
                            <img src="img_web/icons/email.png" alt="">
                            <p>bilboskpes@gmail.com</p>
                        </div>
                        <div class="caja_info">
                            <img src="img_web/icons/location.png" alt="">
                            <p>C/Licenciado Pozas 31, Bilbao 48008</p>
                        </div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2905.516500422879!2d-2.941988724582918!3d43.26155407767438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4e502842c84087%3A0x539b319a98f8cfbe!2sC.%20del%20Lic.%20Poza%2C%2031%2C%2048011%20Bilbao%2C%20Vizcaya!5e0!3m2!1ses!2ses!4v1683456880238!5m2!1ses!2ses" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                  
                    </div>
                </div>
                <div id="formulario">
                    <h2>Cuéntanos...</h2>
                    <p>¿Tienes alguna duda? Escríbenos y te responderemos la más antes posible.</p>
                    <form class="form">
                        <div class="box_form">
                            <div class="box">
                                <label for="Nombre">Nombre:</label>
                                <p type="Nombre:"><input type="text" ></input></p>
                            </div>
                            <div class="box">
                               <label for="">Email:</label> 
                               <p type="Email:"><input type="email" ></input></p>
                            </div>
                        </div>
                       <div class=box_form1>
                            <label for="">Mensaje:</label> 
                            <textarea name="" id="" cols="5" rows="5"></textarea>
                       </div>
                       <button>Enviar mensaje</button>
                    </form>
                </div>
            </div>
        </section>
        <section id="sec2">
            <div class="FAQ">
                <div class="faq">
                	<h2>Preguntas frequentes</h2>
                    <img src="img_web/icons/pregunta.png" alt="">
                </div>
                <div class="container">
                    <div id="question1">
                        <a href="#question1">1. ¿Qué es una sala de escape online?</a>
                        <p>Una sala de escape online es un juego en el que los jugadores resuelven acertijos y enigmas para poder salir de una habitación virtual. Se juega en línea desde cualquier lugar del mundo. </p>
                    </div>
                    <div id="question2">
                        <a href="#question2">2. ¿Cómo puedo reservar una sala de escape online en su página web?</a>
                        <p>Para reservar una sala de escape online, simplemente elige la sala que deseas jugar en nuestra página web, selecciona la fecha y hora en la que deseas jugar, y sigue los pasos del proceso de reserva.</p>
                    </div>
                    <div id="question3">
                        <a href="#question3">3. ¿Cuál es el precio de las salas de escape?</a>
                        <p>BilboSKP tiene un sistema de cupones, los cuales tienen todos el mismo importe y están disponibles en la tienda. Disponemos de bonos los cuales puedes disfutrar.</p>
                    </div>
                    <div id="question4">
                        <a href="#question4">4. ¿Puedo jugar en equipo con amigos que se encuentran en diferentes lugares?</a>
                        <p>Sí, puedes jugar en equipo con amigos que se encuentren en diferentes lugares. Solo necesitas compartir el enlace de la sala de escape online con ellos para que se unan al juego.</p>
                    </div>
                    <div id="question5">
                        <a href="#question5">5. ¿Cómo se garantiza la seguridad de mis datos personales en su página web?</a>
                        <p>En nuestra página web, nos tomamos muy en serio la seguridad de tus datos personales. Utilizamos medidas de seguridad avanzadas para proteger tu información y cumplimos con las regulaciones de protección de datos en línea.</p>
                    </div>
                </div>               
            </div>
             <div class="social_media">
           		<div class="sc_title">
           			<h2>¡Síguenos en nuestras redes!</h2>
           		</div>
             				<div class="sc_box">
             					<a href="https://www.facebook.com/profile.php?id=100092286712706"> <img src="img_web/icons/facebook1.png" alt=""></a>
             					<P>Bilbo SKP</P>
             				</div>
             				<div class="sc_box">
             					<a href="https://www.instagram.com/bilboskp_es/"><img src="img_web/icons/insta1.png" alt=""></a>
             					<P>@bilboskp_es</P>
             				</div>
             				<div class="sc_box">
             					<a href="https://twitter.com/BilboSkp_es"> <img src="img_web/icons/twitter1.png" alt=""></a>
             					<P>@BilboSkp_es</P>
             				</div>
             				<div class="sc_box">
             					<a href="https://chat.whatsapp.com/IPaleWYDzwPLNyOMBpNr4q"><img src="img_web/icons/what.png" alt=""> </a>
             					<P>Chatea con nosotros :)</P>
             				</div>                   
	                       
               </div>
        </section>
    </main>