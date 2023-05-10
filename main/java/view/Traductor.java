//modelo copiado de FUICA con idea de poner aqui las traducciones y todos los textos que hirian en la web
package view;

import java.util.HashMap;

public class Traductor {

	private static HashMap<String, String> mapaTraducciones = null;
	//estructura de los datos = ("lenguaje-id", "texto");

	public static void initFrases() {
		mapaTraducciones=new HashMap<String, String>();
		/*castellano*/
		/*HEADER*/
		mapaTraducciones.put("ES-inicio1", "Experimenta nuestras salas de escape");
		mapaTraducciones.put("EN-inicio1", "Experience our scape rooms");
		mapaTraducciones.put("EN-headerSalas", "Escape rooms");
		mapaTraducciones.put("ES-headerRanking", "Ranking");
		mapaTraducciones.put("EN-headerRanking", "Ranking");
		mapaTraducciones.put("ES-headerUnirse", "Unirse a partida");
		mapaTraducciones.put("EN-headerUnirse", "Join a game");
		mapaTraducciones.put("ES-headerContacto", "Contacto");
		mapaTraducciones.put("EN-headerContacto", "Contact us");
		
		/* INICIO */
	
		/*GENERAL ES*/
		mapaTraducciones.put("ES-todas", "Todas");
		mapaTraducciones.put("ES-online", "Online");
		mapaTraducciones.put("ES-reserva", "Reserva");

		mapaTraducciones.put("ES-modalidad", "Modalidad");
		mapaTraducciones.put("ES-tematica", "Temática");
		mapaTraducciones.put("ES-dificultad", "Dificultad");
		
		mapaTraducciones.put("ES-terror", "Terror");
		mapaTraducciones.put("ES-suspenso", "Suspenso");
		mapaTraducciones.put("ES-misterio", "Misterio");
		mapaTraducciones.put("ES-sci-fi", "Sci-Fi");
		
		mapaTraducciones.put("ES-facil", "Fácil");
		mapaTraducciones.put("ES-media", "Media");
		mapaTraducciones.put("ES-dificil", "Dificil");
		
		/*SALAS ES*/
		mapaTraducciones.put("ES-salas1", "Buscar salas de escape por nombre");
		mapaTraducciones.put("ES-salas2", "Todas las modalidades");
		mapaTraducciones.put("ES-salas3", "Online");
		mapaTraducciones.put("ES-salas4", "Físicas");
		mapaTraducciones.put("ES-salas5", "Todas las temáticas");
		mapaTraducciones.put("ES-salas6", "Todas las dificultades");
		mapaTraducciones.put("ES-salas7", "Mostrando");
		mapaTraducciones.put("ES-salas8", "Resultados");
		mapaTraducciones.put("ES-salas9", "¡No se encontraron salas!");
		mapaTraducciones.put("ES-salas10", "Ver todas las salas");
		mapaTraducciones.put("ES-salas11", "Ver sala");
		
		/* GENERAL EN*/
		mapaTraducciones.put("EN-todas", "All");
		mapaTraducciones.put("EN-online", "Online");
		mapaTraducciones.put("EN-reserva", "Reserve");

		mapaTraducciones.put("EN-modalidad", "Mode");
		mapaTraducciones.put("EN-tematica", "Theme");
		mapaTraducciones.put("EN-dificultad", "Difficulty");

		mapaTraducciones.put("EN-terror", "Terror");
		mapaTraducciones.put("EN-suspenso", "Suspense");
		mapaTraducciones.put("EN-misterio", "Mystery");
		mapaTraducciones.put("EN-sci-fi", "Sci-Fi");

		mapaTraducciones.put("EN-facil", "Easy");
		mapaTraducciones.put("EN-media", "Medium");
		mapaTraducciones.put("EN-dificil", "Hard");
		/* SALAS EN*/
		mapaTraducciones.put("EN-salas1", "Search escape rooms by name");
		mapaTraducciones.put("EN-salas2", "All modes");
		mapaTraducciones.put("EN-salas3", "Online");
		mapaTraducciones.put("EN-salas4", "Reserve");
		mapaTraducciones.put("EN-salas5", "All themes");
		mapaTraducciones.put("EN-salas6", "All difficulties");
		mapaTraducciones.put("EN-salas7", "Showing");
		mapaTraducciones.put("EN-salas8", "Results");
		mapaTraducciones.put("EN-salas9", "No escape rooms found!");
		mapaTraducciones.put("EN-salas10", "View all rooms");
		mapaTraducciones.put("EN-salas11", "View");
		
		/*TIENDA ES*/
		mapaTraducciones.put("ES-Tcomprar", "Comprar cupones");
		mapaTraducciones.put("ES-TcomprarText", "Cada cupón te servirá para organizar una partida en la sala de escape que tu prefieras.");
		mapaTraducciones.put("ES-Tcupon1", "1 cupón");
		mapaTraducciones.put("ES-Tdescuento1", "5% de descuento");
		mapaTraducciones.put("ES-Tcupon3", "3 cupones");
		mapaTraducciones.put("ES-Tdescuento3", "11% de descuento");
		mapaTraducciones.put("ES-TcomprarYa", "Comprar ya");
		mapaTraducciones.put("ES-Tcupon5", "5 cupones");
		mapaTraducciones.put("ES-Tdescuento5", "17% de descuento");
		mapaTraducciones.put("ES-Tcupon7", "1 cupón");
		mapaTraducciones.put("ES-Tdescuento7", "25% de descuento");
		mapaTraducciones.put("ES-Tregalar", "Regalar cupones");
		mapaTraducciones.put("ES-TregalarText", "Quieres regalar un cupón? Introduce los datos del <em><strong>suscriptor</strong></em> al que quieras mandarle el regalo.");
		mapaTraducciones.put("ES-Toferta", "Selecciona oferta");
		mapaTraducciones.put("ES-TregalarBoton", "Regalar cupón");
		mapaTraducciones.put("ES-Temail", "Email del destinatario");
		
		/*Tienda EN*/
		
		mapaTraducciones.put("EN-Tcomprar", "Buy coupons");
		mapaTraducciones.put("EN-TcomprarText", "Each coupon will allow you to book a game in the escape room of your choice.");
		mapaTraducciones.put("EN-Tcupon1", "1 coupon");
		mapaTraducciones.put("EN-Tdescuento1", "5% discount");
		mapaTraducciones.put("EN-Tcupon3", "3 coupons");
		mapaTraducciones.put("EN-Tdescuento3", "11% discount");
		mapaTraducciones.put("EN-TcomprarYa", "Buy now");
		mapaTraducciones.put("EN-Tcupon5", "5 coupons");
		mapaTraducciones.put("EN-Tdescuento5", "17% discount");
		mapaTraducciones.put("EN-Tcupon7", "7 coupons");
		mapaTraducciones.put("EN-Tdescuento7", "25% discount");
		mapaTraducciones.put("EN-Tregalar", "Gift coupons");
		mapaTraducciones.put("EN-TregalarText", "Do you want to gift a coupon? Enter the details of the <em><strong>recipient</strong></em> you want to send the gift to.");
		mapaTraducciones.put("EN-Toferta", "Select offer");
		mapaTraducciones.put("EN-TregalarBoton", "Gift coupon");
		mapaTraducciones.put("EN-Temail", "Destination email");

		/*Contacto ES*/
		
		mapaTraducciones.put("ES-Ch1", "Aquí nos tienes ¿Hablamos?");
		mapaTraducciones.put("ES-Ch2", "Cuéntanos...");
		mapaTraducciones.put("ES-Cp1", "¿Tienes alguna duda? Escríbenos y te responderemos la más antes posible.");
		mapaTraducciones.put("ES-Cnombre", "Nombre:");
		mapaTraducciones.put("ES-Cmensaje", "Mensaje:");
		mapaTraducciones.put("ES-Cenviar", "Enviar mensaje");
		mapaTraducciones.put("ES-Cpreguntas", "Preguntas frequentes");
		mapaTraducciones.put("ES-Cfaq1", "1. ¿Qué es una sala de escape online?");
		mapaTraducciones.put("ES-Cfaq1r", "Una sala de escape online es un juego en el que los jugadores resuelven acertijos y enigmas para poder salir de una habitación virtual. Se juega en línea desde cualquier lugar del mundo.");
		mapaTraducciones.put("ES-Cfaq2", "2. ¿Cómo puedo reservar una sala de escape online en su página web?");
		mapaTraducciones.put("ES-Cfaq2r", "Para reservar una sala de escape online, simplemente elige la sala que deseas jugar en nuestra página web, selecciona la fecha y hora en la que deseas jugar, y sigue los pasos del proceso de reserva.");
		mapaTraducciones.put("ES-Cfaq3", "3. ¿Cuál es el precio de las salas de escape?");
		mapaTraducciones.put("ES-Cfaq3r", "BilboSKP tiene un sistema de cupones, los cuales tienen todos el mismo importe y están disponibles en la tienda. Disponemos de bonos los cuales puedes disfrutar.");
		mapaTraducciones.put("ES-Cfaq4", "4. ¿Puedo jugar en equipo con amigos que se encuentran en diferentes lugares?");
		mapaTraducciones.put("ES-Cfaq4r", "Sí, puedes jugar en equipo con amigos que se encuentren en diferentes lugares. Solo necesitas compartir el enlace de la sala de escape online con ellos para que se unan al juego.");
		mapaTraducciones.put("ES-Cfaq5", "5. ¿Cómo se garantiza la seguridad de mis datos personales en su página web?");
		mapaTraducciones.put("ES-Cfaq5r", "En nuestra página web, nos tomamos muy en serio la seguridad de tus datos personales. Utilizamos medidas de seguridad avanzadas para proteger tu información y cumplimos con las regulaciones de protección de datos en línea.");
		mapaTraducciones.put("ES-Csiguenos", "¡Síguenos en nuestras redes!");
		mapaTraducciones.put("ES-Cchatea", "Chatea con nosotros :)");

		/*Contaco EN*/

		mapaTraducciones.put("EN-Ch1", "Here we are. Shall we talk?");
		mapaTraducciones.put("EN-Ch2", "Tell us...");
		mapaTraducciones.put("EN-Cp1", "Do you have any questions? Write to us and we will respond as soon as possible.");
		mapaTraducciones.put("EN-Cnombre", "Name:");
		mapaTraducciones.put("EN-Cemail", "Email:");
		mapaTraducciones.put("EN-Cmensaje", "Message:");
		mapaTraducciones.put("EN-Cenviar", "Send message");
		mapaTraducciones.put("EN-Cpreguntas", "Frequently Asked Questions");
		mapaTraducciones.put("EN-Cfaq1", "1. What is an online escape room?");
		mapaTraducciones.put("EN-Cfaq1r", "An online escape room is a game where players solve puzzles and riddles to escape from a virtual room. It is played online from anywhere in the world.");
		mapaTraducciones.put("EN-Cfaq2", "2. How can I book an online escape room on your website?");
		mapaTraducciones.put("EN-Cfaq2r", "To book an online escape room, simply choose the room you want to play on our website, select the date and time you want to play, and follow the booking process steps.");
		mapaTraducciones.put("EN-Cfaq3", "3. What is the price of the escape rooms?");
		mapaTraducciones.put("EN-Cfaq3r", "BilboSKP has a coupon system, all of which have the same value and are available in the store. We also offer vouchers that you can enjoy.");
		mapaTraducciones.put("EN-Cfaq4", "4. Can I play as a team with friends in different locations?");
		mapaTraducciones.put("EN-Cfaq4r", "Yes, you can play as a team with friends in different locations. You just need to share the online escape room link with them to join the game.");
		mapaTraducciones.put("EN-Cfaq5", "5. How is the security of my personal data ensured on your website?");
		mapaTraducciones.put("EN-Cfaq5r", "On our website, we take the security of your personal data very seriously. We use advanced security measures to protect your information and comply with online data protection regulations.");
		mapaTraducciones.put("EN-Csiguenos", "Follow us on our social media!");
		mapaTraducciones.put("EN-Cchatea", "Chat with us :)");
		
		
	}

	public static String get(String lenguaje, String claveFrase) {
		if(mapaTraducciones==null) {
			initFrases();
		}
		String frase = mapaTraducciones.get(lenguaje+"-"+claveFrase);
		if (frase==null) {
			System.out.println("Traductor: No he podido encontrar '"+lenguaje+"-"+claveFrase+"' en el hashmap.");
		}
		return frase;
	}

}
