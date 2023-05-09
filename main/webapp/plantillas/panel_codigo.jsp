<%@ page
	import="java.util.Vector, java.util.HashMap, java.util.Enumeration, java.util.Map, model.Flecha,java.util.Date, model.Escenario, 
	model.Sala, model.SalaOnline,model.MensajeChat, java.net.URLEncoder, model.Invitado,model.Anfitrion,model.Jugador,view.StringHelper,view.DateHelper,view.Icon,model.PartidaOnline,model.Suscriptor"%>
<% 
PartidaOnline partidaOnline = (PartidaOnline) request.getAttribute("partidaOnline");
System.out.println("Tipo de instancia: " + partidaOnline.getClass().getSimpleName());

if(partidaOnline == null){
	response.sendRedirect("./salas");
}

%>
<div id="escenario_final" class="flex-center"> 
    <div class="panel flex-center" ontouchstart="">
        <div class="button flex-center">
          <a href="#"></a>
        </div>
      </div>
</div>
<style>
.flex-center{
    display: flex;
    justify-content: center;
    align-items: center;
}
#escenario_final{
  text-align:center;
  background-color:rgb(203, 203, 203);
  height: 100vh;
  background-image: url(img_salas/escenarios/fondoPared.png);
  background-size: cover;
}
.panel{
    background-image: url(img_salas/escenarios/fondoPanel.png);
    background-size: cover;
    background-color: rgb(35, 35, 35);
    border-radius: 5%;
        	width: 45vw;
	    height: 40vw;
}
.button{
  position:relative;
  /*display:inline-block;*/
  display: flex;
  margin:20px;
  border-radius: 50%;
  width: 60%;
  height: 60%;
}
:root{
    --color-1: #E40100;
    --color-2: #910000;
    --color-3: #ff9797;
}
.button a{
    background-color: var(--color-1);
    display: block;
    position: relative;
    padding: 20px 40px;
    width: 98%;
    height: 98%;
    border-radius: 50%;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    text-shadow: 0px 1px 0px #000;
    filter: dropshadow(color=#000, offx=0px, offy=1px);
    -webkit-box-shadow: inset 0 0px 0 var(--color-3), 0 25px 0 var(--color-2);
    -moz-box-shadow: inset 0 0px 0 var(--color-3), 0 25px 0 var(--color-2);
    box-shadow: inset 0 0px 0 var(--color-3), 0 25px 0 var(--color-2);
    border: 0.2em solid rgb(36, 36, 36);
    background: linear-gradient(to top right, #620000, var(--color-1));
}

.button a.active {
  top: 6%;
  background-color: #f70000;
  animation: buttonActive 0.3s ease-in-out forwards;
  pointer-events: none;
}

@keyframes buttonActive {
  0% {
    background-color: var(--color-1);
    top: 0;
  }
  50% {
    background-color: var(--color-2);
  }
  100% {
    background-color: var(--color-1);
    top: 6%;
    -webkit-box-shadow:inset 0 1px 0 var(--color-3), inset 0 -3px 0  var(--color-2);
    -moz-box-shadow:inset 0 1px 0 var(--color-3), inset 0 -3pxpx 0  var(--color-2);
    box-shadow:none, inset 0 40px 0px  var(--color-2);
  }
}

.button:after{
  content:"";
  height:100%;
  width:100%;
  padding:4px;
  position: absolute;
  bottom:-15px;
  left:-4px;
  z-index:-1;
  background-color:#151515;
  border-radius: 50%;
}
@media (max-width: 2000px) {
	.panel{
	}
}
@media (max-width: 1200px) {
	.panel{
	}
}
</style>
<script>
    let button = document.querySelector('.button a');
    let played = false;

    button.addEventListener('click', () => {
    if (!played) {
        played = true;
        button.classList.add('active');
        setTimeout(() => {
            window.location.href = './jugar?accion=finalizar&codInvitacion=<%=partidaOnline.getCodInvitacion()%>';
          }, 1500);
    }
    });
</script>