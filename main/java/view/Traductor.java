//modelo copiado de FUICA con idea de poner aqui las traducciones y todos los textos que hirian en la web
package view;

import java.util.HashMap;

public class Traductor {

	private static HashMap<String, String> mapaTraducciones = null;
	//estructura de los datos = ("lenguaje-id", "texto");

	public static void initFrases() {
		mapaTraducciones=new HashMap<String, String>();
		/*castellano*/
		/*INDEX*/
		mapaTraducciones.put("ES-headerSalas", "Salas de escape");
		mapaTraducciones.put("EN-headerSalas", "Escape rooms");
		mapaTraducciones.put("ES-headerRanking", "Ranking");
		mapaTraducciones.put("EN-headerRanking", "Ranking");
		mapaTraducciones.put("ES-headerTienda", "Tienda");
		mapaTraducciones.put("EN-headerTienda", "Store");
		mapaTraducciones.put("ES-headerUnirse", "Unirse a partida");
		mapaTraducciones.put("EN-headerUnirse", "Join a game");
		mapaTraducciones.put("ES-headerContacto", "Contacto");
		mapaTraducciones.put("EN-headerContacto", "Contact us");
		mapaTraducciones.put("ES-headerSuscribirse", "Suscribirse");
		mapaTraducciones.put("EN-headerSuscribirse", "Suscribe");
		mapaTraducciones.put("ES-footerPriv", "Privacidad");
		mapaTraducciones.put("ES-footerContactanos", "Contáctanos");
		mapaTraducciones.put("ES-footerRedes", "Redes");
		mapaTraducciones.put("EN-footerPriv", "Privacy");
		mapaTraducciones.put("EN-footerContactanos", "Contact us");
		mapaTraducciones.put("EN-footerRedes", "Social media");

		/* INICIO ES */
		mapaTraducciones.put("ES-inicio1", "Experimenta nuestras salas de escape");
		mapaTraducciones.put("ES-inicio2", "Sumérgete en una experiencia de juego única sin salir de tu casa con nuestras emocionantes salas de escape virtuales. ¿Estás listo para poner a prueba tus habilidades mentales y tu capacidad de resolución de problemas?");
		mapaTraducciones.put("ES-inicio3", "Jugar ahora");
		mapaTraducciones.put("ES-inicio4", "Unirse a partida");
		mapaTraducciones.put("ES-inicio5", "<< ¡Descubre nuestras salas online más jugadas! >>");
		mapaTraducciones.put("ES-inicio6", "Salas que te harán desafiar tu capacidad mental");
		mapaTraducciones.put("ES-inicio7", "SOLO O CON AMIGOS");
		mapaTraducciones.put("ES-inicio8", "Puedes realizar cualquiera de nuestros escapes de forma individual o en grupo. Si no das con la tecla quizás otro/a si lo haga. El precio NO cambia.");
		mapaTraducciones.put("ES-inicio9", "MÚLTIPLES AVENTURAS");
		mapaTraducciones.put("ES-inicio10", "Tenemos actualmente varias historias, y estamos trabajando en muchas más. Cada una, tiene tanto una dificultad como un tiempo estimado diferente.");
		mapaTraducciones.put("ES-inicio11", "¿CÓMO FUNCIONA?");
		mapaTraducciones.put("ES-inicio12", "Resuelve puzzles y encuentra la solución en tiempo limitado.	Trabaja solo o en equipo y comunícate a través de chat en salas de escape online.");

		
		
		/* INICIO EN*/
		mapaTraducciones.put("EN-inicio1", "Experience our escape rooms");
		mapaTraducciones.put("EN-inicio2", "Immerse yourself in a unique gaming experience without leaving your home with our thrilling virtual escape rooms. Are you ready to test your mental skills and problem-solving abilities?");
		mapaTraducciones.put("EN-inicio3", "Play now");
		mapaTraducciones.put("EN-inicio4", "Join game");
		mapaTraducciones.put("EN-inicio5", "<< Discover our most played online rooms! >>");
		mapaTraducciones.put("EN-inicio6", "Rooms that will challenge your mental capacity");
		mapaTraducciones.put("EN-inicio7", "ALONE OR WITH FRIENDS");
		mapaTraducciones.put("EN-inicio8", "You can do any of our escapes individually or in a group. If you can't figure it out, maybe someone else can. The price DOES NOT change.");
		mapaTraducciones.put("EN-inicio9", "MULTIPLE ADVENTURES");
		mapaTraducciones.put("EN-inicio10", "We currently have several stories, and we are working on many more. Each one has a different difficulty level and estimated time.");
		mapaTraducciones.put("EN-inicio11", "HOW IT WORKS?");
		mapaTraducciones.put("EN-inicio12", "Solve puzzles and find the solution within a limited time. Work alone or in a team and communicate through chat in online escape rooms.");

		
	
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
		mapaTraducciones.put("ES-Tcupon7", "7 cupón");
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
		
		/*Cupones ES*/
		mapaTraducciones.put("ES-CU1", "Administrar cupones");
		mapaTraducciones.put("ES-CU2", "Aquí podrás encontrar nuestro propio sistema económico, los cupones. Con un cupón puedes organizar una partida y jugar con tus amigos las aventuras que hemos creado para ti.");
		mapaTraducciones.put("ES-CU3", "Mis cupones");
		mapaTraducciones.put("ES-CU4", "Estado:");
		mapaTraducciones.put("ES-CU5", "Fecha caducidad:");
		/*Cupones EN*/
		mapaTraducciones.put("EN-CU1", "Manage coupons");
		mapaTraducciones.put("EN-CU2", "Here you can find our own economic system, the coupons. With a coupon, you can organize a game and play with your friends the adventures we have created for you.");
		mapaTraducciones.put("EN-CU3", "My coupons");
		mapaTraducciones.put("EN-CU4", "Status:");
		mapaTraducciones.put("EN-CU5", "Expiration date:");

		/*Gestion Cuenta ES*/
		mapaTraducciones.put("ES-GC1", "Gestión de la cuenta");
		mapaTraducciones.put("ES-GC2", "Modifica aquí tus datos personales. Recuerda que tanto como el alias, nombre y apellidos pertenecen a tu perfil público.");
		mapaTraducciones.put("ES-GC3", "Nombre:");
		mapaTraducciones.put("ES-GC4", "Apellido:");
		mapaTraducciones.put("ES-GC5", "Télefono:");
		mapaTraducciones.put("ES-GC6", "¿Deseas darte de baja?");
		mapaTraducciones.put("ES-GC7", "Al darte de baja, pasarás a estado inactivo y no se perderán tus datos, avances y/o cupones comprados");
		mapaTraducciones.put("ES-GC8", "Activo:");
		mapaTraducciones.put("ES-GC9", "Fecha de nacimiento:");
		mapaTraducciones.put("ES-GC10", "Guardar cambios");

		/*Gestion cuenta EN*/
		mapaTraducciones.put("EN-GC1", "Account Management");
		mapaTraducciones.put("EN-GC2", "Modify your personal data here. Remember that both the alias, name, and surname belong to your public profile.");
		mapaTraducciones.put("EN-GC3", "Name:");
		mapaTraducciones.put("EN-GC4", "Surname:");
		mapaTraducciones.put("EN-GC5", "Phone number:");
		mapaTraducciones.put("EN-GC6", "Do you want to unsubscribe?");
		mapaTraducciones.put("EN-GC7", "By unsubscribing, you will become inactive, and your data, progress, and/or purchased coupons will not be lost.");
		mapaTraducciones.put("EN-GC8", "Active:");
		mapaTraducciones.put("EN-GC9", "Date of birth:");
		mapaTraducciones.put("EN-GC8", "Save changes");

		/*Suscribirse ES*/
		mapaTraducciones.put("ES-SU1", "Regístrate en BilboSKP");
		mapaTraducciones.put("ES-SU2", "Al darte de alta se te cobrará un importe y recibirás un cupón de bienvenida!");
		mapaTraducciones.put("ES-SU3", "Contraseña:");
		mapaTraducciones.put("ES-SU4", "Número tarjeta:");
		mapaTraducciones.put("ES-SU5", "Nombre:");
		mapaTraducciones.put("ES-SU6", "Apellidos:");
		mapaTraducciones.put("ES-SU7", "Fecha de nacimiento:");
		mapaTraducciones.put("ES-SU8", "Teléfono:");
		mapaTraducciones.put("ES-SU9", "Enviar");
		/*Suscribirse EN*/
		mapaTraducciones.put("EN-SU1", "Sign up for BilboSKP");
		mapaTraducciones.put("EN-SU2", "By signing up, you will be charged an amount and receive a welcome coupon!");
		mapaTraducciones.put("EN-SU3", "Password:");
		mapaTraducciones.put("EN-SU4", "Card number:");
		mapaTraducciones.put("EN-SU5", "First name:");
		mapaTraducciones.put("EN-SU6", "Last name:");
		mapaTraducciones.put("EN-SU7", "Date of birth:");
		mapaTraducciones.put("EN-SU8", "Phone:");
		mapaTraducciones.put("EN-SU9", "Submit");

		/*Perfil ES*/
		mapaTraducciones.put("ES-PE1", "Mi perfil");
		mapaTraducciones.put("ES-PE1", "Gestión de la cuenta");
		mapaTraducciones.put("ES-PE1", "Mis reservas");
		mapaTraducciones.put("ES-PE1", "Mis cupones");
		mapaTraducciones.put("ES-PE1", "Cerrar sesión");
		/*Perfil EN*/
		mapaTraducciones.put("EN-PE1", "My profile");
		mapaTraducciones.put("EN-PE2", "Account management");
		mapaTraducciones.put("EN-PE3", "My bookings");
		mapaTraducciones.put("EN-PE4", "My coupons");
		mapaTraducciones.put("EN-PE5", "Log out");
		/*Caja login ES*/
		mapaTraducciones.put("ES-LO1", "Iniciar sesión");
		mapaTraducciones.put("ES-LO2", "Correo electrónico");
		mapaTraducciones.put("ES-LO3", "Contraseña");
		mapaTraducciones.put("ES-LO4", "Iniciar sesión");
		mapaTraducciones.put("ES-LO5", "No estoy suscrito");
		mapaTraducciones.put("ES-LO6", "Olvidé mi contraseña");
		/*Caja login EN*/
		mapaTraducciones.put("EN-LO1", "Log in");
		mapaTraducciones.put("EN-LO2", "Email");
		mapaTraducciones.put("EN-LO3", "Password");
		mapaTraducciones.put("EN-LO4", "Log in");
		mapaTraducciones.put("EN-LO5", "Not subscribed");
		mapaTraducciones.put("EN-LO6", "Forgot my password");
		/*Unirse ES*/
		mapaTraducciones.put("ES-UN1", "Introduce un código de partida");
		mapaTraducciones.put("ES-UN2", "Código de partida online");
		mapaTraducciones.put("ES-UN3", "Unirse a partida");
		mapaTraducciones.put("ES-UN4", "¿Cómo funciona unirse a una partida?");
		/*Unirse EN*/
		mapaTraducciones.put("EN-UN1", "Enter a game code");
		mapaTraducciones.put("EN-UN2", "Online game code");
		mapaTraducciones.put("EN-UN3", "Join game");
		mapaTraducciones.put("EN-UN4", "How does joining a game work?");
		/*Reservas ES*/
		mapaTraducciones.put("ES-RE1", "Administra tus reservas");
		mapaTraducciones.put("ES-RE2", "Puedes ver o cancelar tus reservas para las salas de escape físicas.Ten en cuenta que tus reservas se mostrarán por orden de fecha de caducidad más cercana.");
		/*Reservas EN*/
		mapaTraducciones.put("EN-RE1", "Manage your bookings");
		mapaTraducciones.put("EN-RE2", "You can view or cancel your bookings for physical escape rooms. Please note that your bookings will be displayed in order of closest expiration date.");
		/*Organizar ES*/
		mapaTraducciones.put("ES-OR1", "Invitar con código");
		mapaTraducciones.put("ES-OR2", "Invitar con enlace");
		mapaTraducciones.put("ES-OR3", "Jugadores en espera");
		mapaTraducciones.put("ES-OR4", "Iniciar partida");
		/*Organizar EN*/
		mapaTraducciones.put("EN-OR1", "Invite with code");
		mapaTraducciones.put("EN-OR2", "Invite with link");
		mapaTraducciones.put("EN-OR3", "Players in waiting");
		mapaTraducciones.put("EN-OR4", "Start game");

		/*Ver sala ES*/
		mapaTraducciones.put("ES-VS1", "Esta es una sala física, por lo que funciona por medio de una reserva. ¡Puedes seleccionar entre horarios disponibles y seleccionar la cantidad de participantes que acudirán a la sala!");
		mapaTraducciones.put("ES-VS2", "No quedan fechas libres para reservar en esta sala, ¡por favor echa un vistazo más tarde!");
		mapaTraducciones.put("ES-VS3", "Escoge una fecha:");
		mapaTraducciones.put("ES-VS4", "Selecciona una fecha");
		mapaTraducciones.put("ES-VS5", "Número de jugadores que participarán:");
		mapaTraducciones.put("ES-VS6", "No hay horarios disponibles para esa fecha, ¡Echa un ojo en un rato!");
		mapaTraducciones.put("ES-VS7", "¡Seleciona una fecha disponible para poder ver los horarios!");
		mapaTraducciones.put("ES-VS8", "Esta es una sala online, por lo que puedes acceder a ella en	cualquier momento, pero eso sí, asegúrate de traer a tus amigos	para vencerla rápido, y por supuesto pasar unas buenas risas. Podrás invitar a tus amigos cuando estés organizando la partida.");
		mapaTraducciones.put("ES-VS9", "Esta sala no está disponible actualmente");
		mapaTraducciones.put("ES-VS10", "Horarios disponibles");
		mapaTraducciones.put("ES-VS11", "Reservar sala");
		mapaTraducciones.put("ES-VS12", "Organizar partida");
		/*Ver sala EN*/
		mapaTraducciones.put("EN-VS1", "This is a physical room, so it works through a booking. You can choose from available time slots and select the number of participants attending the room!");
		mapaTraducciones.put("EN-VS2", "There are no available dates to book in this room. Please check back later!");
		mapaTraducciones.put("EN-VS3", "Choose a date:");
		mapaTraducciones.put("EN-VS4", "Select a date");
		mapaTraducciones.put("EN-VS5", "Number of players participating:");
		mapaTraducciones.put("EN-VS6", "There are no available time slots for that date. Please check back later!");
		mapaTraducciones.put("EN-VS7", "Select an available date to view the time slots!");
		mapaTraducciones.put("EN-VS8", "This is an online room, so you can access it at any time. However, make sure to bring your friends to beat it quickly and, of course, have a good laugh. You can invite your friends when you're organizing the game.");
		mapaTraducciones.put("EN-VS9", "This room is currently unavailable.");
		mapaTraducciones.put("EN-VS10", "Available time slots");
		mapaTraducciones.put("EN-VS11", "Book room");
		mapaTraducciones.put("EN-VS12", "Organize game");

		
		
		
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
