<%@ page
	import="java.util.HashMap, java.util.Map, java.util.ArrayList, java.io.File, java.text.Normalizer, 
	model.Suscriptor,view.Traductor, model.SalaOnline, model.SalaFisica, view.AppConfig, java.util.Date, view.CookieHelper"%>
<link rel="stylesheet" href="css/contacto.css">
 <%String leng = CookieHelper.getLenguajeFromCookies(request.getCookies()); %>
 
<main>
        <div class="cajatexto1">
            <h1><%=Traductor.get(leng,"Ch1")%></h1>
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
                    <h2><%=Traductor.get(leng,"Ch2")%></h2>
                    <p><%=Traductor.get(leng,"Cp1")%></p>
                    <form class="form">
                        <div class="box_form">
                            <div class="box">
                                <label for="Nombre"><%=Traductor.get(leng,"Cnombre")%></label>
                                <p type="Nombre:"><input type="text" ></input></p>
                            </div>
                            <div class="box">
                               <label for="">Email:</label> 
                               <p type="Email:"><input type="email" ></input></p>
                            </div>
                        </div>
                       <div class=box_form1>
                            <label for=""><%=Traductor.get(leng,"Cmensaje")%></label> 
                            <textarea name="" id="" cols="5" rows="5"></textarea>
                       </div>
                       <button><%=Traductor.get(leng,"Cenviar")%></button>
                    </form>
                </div>
            </div>
        </section>
        <section id="sec2">
            <div class="FAQ">
                <div class="faq">
                	<h2><%=Traductor.get(leng,"Cpreguntas")%></h2>
                    <img src="img_web/icons/pregunta.png" alt="">
                </div>
                <div class="container">
                    <div id="question1">
                        <a href="#question1"><%=Traductor.get(leng,"Cfaq1")%></a>
                        <p><%=Traductor.get(leng,"Cfaq1r")%></p>
                    </div>
                    <div id="question2">
                        <a href="#question2"><%=Traductor.get(leng,"Cfaq2")%></a>
                        <p><%=Traductor.get(leng,"Cfaq2r")%></p>
                    </div>
                    <div id="question3">
                        <a href="#question3"><%=Traductor.get(leng,"Cfaq3")%></a>
                        <p><%=Traductor.get(leng,"Cfaq3r")%></p>
                    </div>
                    <div id="question4">
                        <a href="#question4"><%=Traductor.get(leng,"Cfaq4")%></a>
                        <p><%=Traductor.get(leng,"Cfaq4r")%></p>
                    </div>
                    <div id="question5">
                        <a href="#question5"><%=Traductor.get(leng,"Cfaq5")%></a>
                        <p><%=Traductor.get(leng,"Cfaq5r")%></p>
                    </div>
                </div>               
            </div>
             <div class="social_media">
           		<div class="sc_title">
           			<h2><%=Traductor.get(leng,"Csiguenos")%></h2>
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
             					<P><%=Traductor.get(leng,"Cchatea")%></P>
             				</div>                   
	                       
               </div>
        </section>
    </main>