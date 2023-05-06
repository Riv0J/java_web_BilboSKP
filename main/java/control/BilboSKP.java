package control;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Vector;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;

import connection.DBC;
import connection.SQLHelper;
import model.Cupon;
import model.Horario;
import model.Partida;
import model.PartidaOnline;
import model.Reserva;
import model.Sala;
import model.SalaFisica;
import model.SalaOnline;
import model.Suscriptor;

public class BilboSKP extends DBC {
	private static final String dbUrl = "localhost:3306/bilboskpdb";
	private static final String user = "root";
	private static final String pass = "";
	private static boolean estadoRanking = true;

	public BilboSKP() throws Throwable {
		super(DBC.DRIVER_MYSQL, dbUrl, user, pass);
	}

	protected static void setEstadoRanking(boolean nuevoEstado) {
		estadoRanking = nuevoEstado;
	}

	protected static boolean getEstadoRanking() {
		return estadoRanking;
	}

	// obtener las salas con mas partidas jugadas
	public static Vector<SalaOnline> getSalasMasJugadas(int limit) throws Throwable {
		Vector<SalaOnline> vectorSalasOnlineTop = new Vector<SalaOnline>();
		String nombreVista = "salas_mas_jugadas";
		try {
			// hacer una vista si no existe
			String sentenciaSQL = "CREATE VIEW if not exists " + nombreVista
					+ " AS SELECT s.*, COUNT(p.idPartida) AS cantidad_partidas_jugadas FROM salaonline s LEFT JOIN partidaonline p ON s.idSala = p.idSalaOnline GROUP BY s.idSala ORDER BY cantidad_partidas_jugadas DESC;";
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 0) {
				System.out.println("La vista de top salas ya existia");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error tratando de crear vista");
		}
		try {
			// obtener las 3 salas mas jugadas de dicha vista
			String sentenciaSQL2 = "select * from " + nombreVista + " order by cantidad_partidas_jugadas desc limit "
					+ limit;
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL2);
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idSala = resultado.getInt("idSala");
				String nombre = resultado.getString("nombre");
				String dificultad = resultado.getString("dificultad");
				String tematica = resultado.getString("tematica");
				String descripcion = resultado.getString("descripcion");

				SalaOnline sala = new SalaOnline(idSala, nombre, dificultad, tematica, descripcion);
				// agregar sala al vector
				vectorSalasOnlineTop.add(sala);
			}

		} catch (Exception e) {
		}

		return vectorSalasOnlineTop;
	}

	// conectarse a la BD y obtener todas las salas online @Rivo
	public static Vector<SalaOnline> getSalasOnline() throws Throwable {
		try {
			// crear el vector que vamos a devolver
			Vector<SalaOnline> vectorSalasOnline = new Vector<SalaOnline>();
			// hacer sentencia sql select todas las salas
			String sentenciaSQL = "select * from salaonline order by idSala;";
			// hacer una conexion
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idSala = resultado.getInt("idSala");
				String nombre = resultado.getString("nombre");
				String dificultad = resultado.getString("dificultad");
				String tematica = resultado.getString("tematica");
				String descripcion = resultado.getString("descripcion");
				int tiempoMax = resultado.getInt("tiempoMax");
				int jugadoresMin = resultado.getInt("jugadoresMin");
				int jugadoresMax = resultado.getInt("jugadoresMax");
				int edadRecomendada = resultado.getInt("edad_Recomendada");

				SalaOnline sala = new SalaOnline(idSala, nombre, dificultad, tematica, descripcion, tiempoMax,
						jugadoresMin, jugadoresMax, edadRecomendada);
				// agregar sala al vector
				vectorSalasOnline.add(sala);
			}

			// hacer syso de las salas obtenidas
			System.out.println("Salas obtenidas:");
			if (vectorSalasOnline.size() > 0) {
				for (int i = 0; i < vectorSalasOnline.size(); i++) {
					Sala SO = vectorSalasOnline.get(i);
					System.out.println(SO.getIdSala() + " > " + SO.getNombre());
				}
			}
			System.out.println("-----");
			conexion.cerrarFlujo();
			return vectorSalasOnline;
		} catch (Exception e) {
			BilboSKP.sysoError("Error en getSalasOnline");
			e.printStackTrace();
		}
		return null;
	}

	// actualizar las salas en una coleccion clave-valor en el hashmap de la clase
	// @Rivo
	public static boolean cargarSalasOnline() throws Throwable {
		try {
			// limpiar todas las salas cargadas anteriormente
			SalaOnline.clearSalasCargadas();

			// obtener las salas de la bd
			Vector<SalaOnline> vectorSalasOnline = BilboSKP.getSalasOnline();

			// crear un nuevo hashmap(coleccion clave-valor)
			HashMap<Integer, SalaOnline> salasPorCargar = new HashMap<Integer, SalaOnline>();

			// si hay un vector de salas
			if (vectorSalasOnline != null) {
				// por cada sala la agregamos al hashmap
				for (SalaOnline sala : vectorSalasOnline) {
					// clave: el codigo de sala, valor: la sala
					salasPorCargar.put(sala.getIdSala(), sala);
				}
				// si vectorSalasOnline tiene tamaÃ±o 0 quiere decir que no habian salas en el
				// vector
				if (vectorSalasOnline.size() == 0) {
					BilboSKP.sysoError("No se encontraron salas que cargar");
				}
				// hacer un set a las salas cargadas
				SalaOnline.setSalasCargadas(salasPorCargar);
				return true;
			}

		} catch (Exception e) {
			BilboSKP.sysoError("Error en cargarSalas");
			e.printStackTrace();
		}
		return false;

	}

	private static void sysoError(String mensaje) {
		System.out.println("DBC_BilboSKP: " + mensaje);
	}

	// conectarse a la BD y obtener todas las salas fisicas @Urko
	public static Vector<SalaFisica> getSalasFisicas() throws Throwable {
		try {
			// crear el vector que vamos a devolver
			Vector<SalaFisica> vectorSalasFisicas = new Vector<SalaFisica>();
			// hacer sentencia sql select todas las salas
			String sentenciaSQL = "select * from salafisica order by idSala;";
			// hacer una conexion
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idSala = resultado.getInt("idSala");
				String nombre = resultado.getString("nombre");
				String dificultad = resultado.getString("dificultad");
				String tematica = resultado.getString("tematica");
				String descripcion = resultado.getString("descripcion");
				int tiempoMax = resultado.getInt("tiempoMax");
				int jugadoresMin = resultado.getInt("jugadoresMin");
				int jugadoresMax = resultado.getInt("jugadoresMax");
				int edad_recomendada = resultado.getInt("edad_recomendada");
				String direccion = resultado.getString("direccion");
				int telefono = resultado.getInt("telefono");

				SalaFisica sala = new SalaFisica(idSala, nombre, dificultad, tematica, descripcion, tiempoMax,
						jugadoresMin, jugadoresMax, edad_recomendada, direccion, telefono);

				// intentar obtener los horarios de esta sala física
				Vector<Horario> vectorHorarios = BilboSKP.obtenerHorariosSalaFisica(idSala);
				sala.setVectorHorariosDisponibles(vectorHorarios);
				// agregar sala al vector
				vectorSalasFisicas.add(sala);
			}

			// hacer syso de las salas obtenidas
			System.out.println("Salas obtenidas:");
			if (vectorSalasFisicas.size() > 0) {
				for (int i = 0; i < vectorSalasFisicas.size(); i++) {
					Sala SO = vectorSalasFisicas.get(i);
					System.out.println(SO.getIdSala() + " > " + SO.getNombre());
				}
			}
			System.out.println("-----");
			conexion.cerrarFlujo();
			return vectorSalasFisicas;
		} catch (Exception e) {
			BilboSKP.sysoError("Error en getSalasFisicas");
			e.printStackTrace();
		}
		return null;
	}

	// actualizar las salas en una coleccion clave-valor en el hashmap de la clase
	// @Urko
	public static boolean cargarSalasFisicas() throws Throwable {
		try {
			// limpiar todas las salas cargadas anteriormente
			SalaFisica.clearSalasCargadas();

			// obtener las salas de la bd
			Vector<SalaFisica> vectorSalasFisicas = BilboSKP.getSalasFisicas();

			// crear un nuevo hashmap(coleccion clave-valor)
			HashMap<Integer, SalaFisica> salasPorCargar = new HashMap<Integer, SalaFisica>();

			// si hay un vector de salas
			if (vectorSalasFisicas != null) {
				// por cada sala la agregamos al hashmap
				for (SalaFisica sala : vectorSalasFisicas) {
					// clave: el codigo de sala, valor: la sala
					salasPorCargar.put(sala.getIdSala(), sala);
				}
				// si vectorSalasFisicas tiene tamaño 0 quiere decir que no habian salas en
				// el
				// vector
				if (vectorSalasFisicas.size() == 0) {
					BilboSKP.sysoError("No se encontraron salas que cargar");
				}
				// hacer un set a las salas cargadas
				SalaFisica.setSalasCargadas(salasPorCargar);
				return true;
			}

		} catch (Exception e) {
			BilboSKP.sysoError("Error en cargarSalas");
			e.printStackTrace();
		}
		return false;
	}

	// conectarse a la BD y obtener todos los horarios de la sala fisica @Urko
	public static Vector<Horario> obtenerHorariosSalaFisica(int idSala) throws Throwable {
		try {
			// crear el vector que vamos a devolver
			Vector<Horario> vectorFechasSalasFisicas = new Vector<Horario>();

			// hacer sentencia sql select todas los horarios de la sala que queremos,
			// exluyendo fechas pasadas
			String sentenciaSQL = "SELECT * FROM horario WHERE idSalaFisica='" + idSala
					+ "' AND disponible=1 AND fechaHora >= '" + SQLHelper.getFechaAhoraSQL() + "' ORDER BY fechaHora;";
			// hacer una conexion
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				Timestamp fechaHora = resultado.getTimestamp("fechaHora");
				boolean disponible = resultado.getBoolean("disponible");

				Horario horario = new Horario(fechaHora, disponible);
				// agregar horario al vector
				vectorFechasSalasFisicas.add(horario);
			}

			// hacer syso de los horarios obtenidos
			// System.out.println("Horarios disponibles en la sala con id " + idSala + ":");
			if (vectorFechasSalasFisicas.size() > 0) {
				for (int i = 0; i < vectorFechasSalasFisicas.size(); i++) {
					Horario ho = vectorFechasSalasFisicas.get(i);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String fechaHoraString = sdf.format(ho.getFechaHora());
					// System.out.println(fechaHoraString);
					// System.out.println(HO.getFechaHora());
				}
			}
			// System.out.println("-----------------------------------");
			conexion.cerrarFlujo();
			return vectorFechasSalasFisicas;
		} catch (Exception e) {
			BilboSKP.sysoError("Error en getFechasSalasFisicas");
			e.printStackTrace();
		}
		return null;
	}

	// obtener los datos de un suscriptor dado su id @Torni
	public static Suscriptor getDatosSuscriptor(int idSuscriptor) throws Throwable {
		// hacer sentencia sql select todas las salas
		String sentenciaSQL = "select * from suscriptor where idSuscriptor = " + idSuscriptor + ";";
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el resultset
		ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
		// hacer un bucle de cada fila que tiene el resultset resultado
		resultado.next();
		// obtener los campos de cada columna para esta fila
		int telefono = resultado.getInt("telefono");
		String email = resultado.getString("email");
		String alias = resultado.getString("alias");
		String nombre = resultado.getString("nombre");
		String apellidos = resultado.getString("apellidos");
		String imagen = resultado.getString("imagen");
		int activo = resultado.getInt("activo");
		Date fech_nac = resultado.getDate("fech_nac");

		Suscriptor suscriptor = new Suscriptor(idSuscriptor, telefono, email, alias, nombre, apellidos, imagen, activo,
				fech_nac);

		return suscriptor;
	}

	// Verificar si el email y pass son correctos, devuelve el suscriptor. @Torni
	public static Suscriptor loginSuscriptor(String email, String pass) throws Throwable {

		// hacer sentencia sql select todas las salas
		String sentenciaSQL = "select * from suscriptor where email = '" + email + "' and pass='"
				+ Security.encriptarPass(pass) + "';";
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el resultset
		// resultado
		ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
		// hacer un if de cada fila que tiene el resultset resultado
		if (resultado.next()) {
			int telefono = resultado.getInt("telefono");
			String alias = resultado.getString("alias");
			String nombre = resultado.getString("nombre");
			String apellidos = resultado.getString("apellidos");
			String imagen = resultado.getString("imagen");
			int activo = resultado.getInt("activo");
			Date fech_nac = resultado.getDate("fech_nac");
			int idSuscriptor = resultado.getInt("idSuscriptor");

			Suscriptor suscriptor = new Suscriptor(idSuscriptor, telefono, email, alias, nombre, apellidos, imagen,
					activo, fech_nac);
			System.out.println("Bienvenido, tu email es: " + suscriptor.getEmail());
			return suscriptor;
		} else {
			System.out.println("EMAIL O PASS INCORRECTO EN LOGIN");
		}
		return null;
	}

	// metodo que pide los campos de un suscriptor y crea una suscripcion @Torni
	public static Suscriptor crearSuscripcion(String email, String pass, int telefono, String alias, String nombre,
			String apellidos, java.sql.Date fech_nac) throws Throwable {
		// hacer sentencia sql select todas las salas
		/*
		 * String sentenciaSQL =
		 * "INSERT INTO `suscriptor` (`email`, `pass`, `alias`, `nombre`, `apellidos`, `fech_nac`, `telefono`) VALUES ('"
		 * + email + "', '" + pass + "', '" + alias + "', '" + nombre + "', '" +
		 * apellidos + "', '" + fech_nac + "', '" + telefono + "');";
		 */
		String[] arrayColumnas = { "email", "pass", "alias", "nombre", "apellidos", "fech_nac", "telefono", "imagen" };
		Object[] arrayValores = { email, Security.encriptarPass(pass), alias, nombre, apellidos, fech_nac, telefono,
				generarRutaImagenDefault() };
		String sentenciaSQL = SQLHelper.obtenerSentenciaSQLInsert("suscriptor", arrayColumnas, arrayValores);
		System.out.println(sentenciaSQL);
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el resultset
		// resultado
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
		if (filasAfectadas == 1) {
			Suscriptor sus = loginSuscriptor(email, pass);
			if (sus != null) {
				otorgarCupon(Cupon.CUPON_BIENVENIDA, sus.getIdSuscriptor());
				sus.getIdSuscriptor();
				return sus;
			}
			return null;

		} else {
			System.out.println("BilboSKP: No se pudo crear nuevo suscriptor");
			return null;
		}
	}

	// comprobar si un suscriptor existe mediante su alias y correo
	public static Suscriptor comprobarSuscriptor(String email) throws Throwable {

		// sentencia sql que compruebe si existe
		String sentenciaSQL = "Select * from 'suscriptor' where email='" + email + "';";
		// hacer conexion
		BilboSKP conexion;
		conexion = new BilboSKP();
		Suscriptor sus = (Suscriptor) conexion.SQLQuery(sentenciaSQL);
		// como el resultado tiene que ser unico podemos sacar el id del suscriptor
		if (sus != null) {
			return sus;
		} else {
			System.out.println("suscriptor no existe");
			return null;
		}
	}

	// obtener ranking dado un id sala online @Urko
	public static Vector<PartidaOnline> obtenerRankingSalaOnline(int idSala) throws Throwable {
		try {
			// crear el vector que vamos a devolver
			Vector<PartidaOnline> vectorPartidas = new Vector<PartidaOnline>();
			// hacer sentencia sql para crear el ranking
			String sentenciaSQL = "SELECT * FROM `partidaonline` where idSalaOnline='" + idSala
					+ "' order by puntaje desc limit 10;";
			// hacer conexion
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idPartida = resultado.getInt("idPartida");
				int idSalaOnline = resultado.getInt("idSalaOnline");
				int idAnfitrion = resultado.getInt("idAnfitrion");
				int puntaje = resultado.getInt("puntaje");
				int numeroJugadores = resultado.getInt("numeroJugadores");
				int visibleRanking = resultado.getInt("visibleRanking");
				String nombreGrupo = resultado.getString("nombreGrupo");
				Timestamp fechaInicio = resultado.getTimestamp("fechaInicio");
				Timestamp fechaFin = resultado.getTimestamp("fechaFin");

				PartidaOnline partida = new PartidaOnline(SalaOnline.getSalaPorId(idSalaOnline),
						getDatosSuscriptor(idAnfitrion), idPartida, puntaje, numeroJugadores, nombreGrupo, fechaInicio,
						fechaFin, visibleRanking);
				vectorPartidas.add(partida);
			}

			// syso de los horarios obtenidos
			System.out.println("Mejores puntos la sala con id " + idSala + ":");
			if (vectorPartidas.size() > 0) {
				for (int i = 0; i < vectorPartidas.size(); i++) {
					Partida pa = vectorPartidas.get(i);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String fechaHoraString = sdf.format(pa.getFechaInicio());
					// System.out.println(pa.getNombreGrupo() + ", " + pa.getPuntaje() + " puntos, "
					// + fechaHoraString);
				}
			}
			conexion.cerrarFlujo();
			return vectorPartidas;
		} catch (Exception e) {
			BilboSKP.sysoError("Error en obtenerRankingSalaOnline");
			e.printStackTrace();
		}
		return null;
	}

	// obtener ranking dado un id sala fisica @Urko
	public static Vector<Partida> obtenerRankingSalaFisica(int idSala) throws Throwable {
		try {
			// crear el vector que vamos a devolver
			Vector<Partida> vectorPartidas = new Vector<Partida>();
			// hacer sentencia sql para crear el ranking
			String sentenciaSQL = "SELECT * FROM `partidafisica` where idSalaFisica='" + idSala
					+ "' order by puntaje desc limit 10;";
			// hacer conexion
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset
			while (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idPartida = resultado.getInt("idPartida");
				String idSalaFisica = resultado.getString("idSalaFisica");
				String idReserva = resultado.getString("idReserva");
				int idAnfitrion = 0;
				int puntaje = resultado.getInt("puntaje");
				int numeroJugadores = resultado.getInt("numeroJugadores");
				String nombreGrupo = resultado.getString("nombreGrupo");
				Timestamp fechaInicio = resultado.getTimestamp("fechaInicio");
				Timestamp fechaFin = resultado.getTimestamp("fechaFin");

				Partida partida = new Partida(SalaFisica.datosSalaFisica(idSalaFisica), getDatosSuscriptor(idAnfitrion),
						idPartida, puntaje, numeroJugadores, nombreGrupo, fechaInicio, fechaFin);
				vectorPartidas.add(partida);
			}

			// hacer syso de los horarios obtenidos
			System.out.println("Mejores puntos la sala con id " + idSala + ":");
			if (vectorPartidas.size() > 0) {
				for (int i = 0; i < vectorPartidas.size(); i++) {
					Partida pa = vectorPartidas.get(i);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String fechaHoraString = sdf.format(pa.getFechaInicio());
					System.out.println(pa.getNombreGrupo() + ", " + pa.getPuntaje() + " puntos, " + fechaHoraString);

				}
			}
			conexion.cerrarFlujo();
			return vectorPartidas;

		} catch (Exception e) {
			BilboSKP.sysoError("Error en obtenerRankingSalaFisica");
			e.printStackTrace();
		}
		return null;
	}

	public static boolean ReiniciarRanking(int idSala) throws Throwable {
		try {
			String sentenciaSQL = "DELETE * FROM partidaonline WHERE idSala = " + idSala + ";";
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas >= 1) {
				System.out.println(sentenciaSQL);
				System.out.println("Se han borrado datos de ranking con exito");
			} else {
				System.out.println("No se han borrado datos de ranking");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error al reiniciar ranking");
		}
		return false;
	}

	// guardar una partida online en la bd @Rivo
	public static boolean guardarPartidaOnline(PartidaOnline PO) {
		try {
			if (getEstadoRanking() == false) {
				System.out.println("ERROR GUARDANDO PARTIDA ONLINE. El ranking está cerrado.");
				return false;
			}
			// hacer una sentencia sql
			int idSala = PO.getSala().getIdSala();
			int idAnfitrion = PO.getAnfitrion().getIdSuscriptor();
			int puntaje = PO.getPuntaje();
			int numeroJugadores = PO.getNumJugadores();
			String NG = PO.getNombreGrupo();
			java.sql.Date fechaSQLInicio = SQLHelper.convertirFechaUtilASql(PO.getFechaInicio());
			java.sql.Date fechaSQLFin = SQLHelper.convertirFechaUtilASql(PO.getFechaFin());

			if (fechaSQLFin == null || fechaSQLInicio == null) {
				fechaSQLInicio = SQLHelper.convertirFechaUtilASql(new Date());
				fechaSQLFin = SQLHelper.getFechaFinPruebaSQL(new Date());
				System.out.println("Fechas de prueba asignadas correctamente.");
			}

			String[] arrayColumnas = { "idSalaOnline", "idAnfitrion", "puntaje", "numeroJugadores", "nombreGrupo",
					"fechaInicio", "fechaFin" };
			Object[] arrayValores = { idSala, idAnfitrion, puntaje, numeroJugadores, NG, fechaSQLInicio, fechaSQLFin };
			String sentenciaSQL = SQLHelper.obtenerSentenciaSQLInsert("partidaonline", arrayColumnas, arrayValores);
			System.out.println(sentenciaSQL);
			// hacer una consulta sql con la conexion y se guarda en el resultset resultado
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println("Partida de " + PO.getNombreGrupo() + " guardada exitosamente");
				return true;
			} else {
				System.out.println("ERROR GUARDANDO PARTIDA ONLINE. No se pudo guardar partida online");
				return false;
			}
		} catch (Throwable e) {
			System.out.println("ERROR GUARDANDO PARTIDA ONLINE");
			e.printStackTrace();
			return false;
		}
	}

	// dado un idSuscriptor e idPartidaOnline, agregarlos a la tabla de
	// suscriptor_partidaonline en la BD @Rivo
	public static boolean agregarSuscriptorParticipante(int idSuscriptor, int idPartidaOnline) throws Throwable {
		try {
			String[] arrayColumnas = { "idSuscriptor", "idPartidaonline" };
			Object[] arrayValores = { idSuscriptor, idPartidaOnline };
			String sentenciaSQL = SQLHelper.obtenerSentenciaSQLInsert("suscriptor_partidaonline", arrayColumnas,
					arrayValores);

			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println(sentenciaSQL);
				System.out.println(
						"Suscriptor " + idSuscriptor + " agregado a la partida " + idPartidaOnline + " exitosamente");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Conseguir los cupones de un suscriptor por su id public static @Inigo
	public static Vector<Cupon> getCuponesSuscriptor(int idSuscriptor) throws Throwable {
		Vector<Cupon> vectorCupones = new Vector<Cupon>();
		String sentenciaSQL = "select * from cupon where idSuscriptor = " + idSuscriptor + " order by fechaCaducidad;";
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el resultset
		ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
		// hacer un bucle de cada fila que tiene el resultset resultado
		while (resultado.next()) {
			// obtener los campos de cada columna para esta fila
			int idCupon = resultado.getInt("idCupon");
			Date fechaCaducidad = resultado.getDate("fechaCaducidad");
			String Estado = resultado.getString("estado");
			int reembolsable = resultado.getInt("reembolsable");
			System.out.println(idCupon);
			Cupon cupon = new Cupon(idCupon, Estado, fechaCaducidad, reembolsable);
			vectorCupones.add(cupon);
		}
		return vectorCupones;
	}

	// cambiar estado de un cupon @Inigo
	public static boolean cambiarEstadoCupon(String nuevoEstado, int idCupon) throws Throwable {
		try {
			String sentenciaSQL = "UPDATE cupon SET estado=" + nuevoEstado + " WHERE idCupon=" + idCupon + ";";
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println("BilboSKP: Se pudo cambiar el estado del cupon");
				return true;
			} else {
				System.out.println("BilboSKP: NO Se pudo cambiar el estado del cupon");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BilboSKP: Error cambiando el estado del cupon");
		}
		return false;
	}
	//obtener el cupon de menor caducidad con estado disponible @Rivo
	public static Cupon comprobarCupon(String estadoAComprobar, int idSuscriptor) throws Throwable {
		try {
			String sentenciaSQL = "select * from cupon where idSuscriptor = '"+idSuscriptor+"' and estado = '"+estadoAComprobar+"' order by fechaCaducidad limit 1;";
			BilboSKP conexion = new BilboSKP();
			ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
			// hacer un bucle de cada fila que tiene el resultset resultado
			if (resultado.next()) {
				// obtener los campos de cada columna para esta fila
				int idCupon = resultado.getInt("idCupon");
				Date fechaCaducidad = resultado.getDate("fechaCaducidad");
				String Estado = resultado.getString("estado");
				int reembolsable = resultado.getInt("reembolsable");
				System.out.println(idCupon);
				return new Cupon(idCupon, Estado, fechaCaducidad, reembolsable);
			} else {
				System.out.println("BilboSKP: El sucriptor con id "+idSuscriptor+" no tiene cupon disponible.");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BilboSKP: Error cambiando el estado del cupon");
		}
		return null;
	}
	// usar cupon de menor caducidad @Rivo
	public static boolean usarCupon(int idSuscriptor) throws Throwable {
		try {
			//obtener cupon disponible con menor caducidad
			Cupon cuponMenorCaducidad = comprobarCupon("Disponible", idSuscriptor);
			if (cuponMenorCaducidad !=null) {
				//cambiar estado a en uso
				boolean cambiarEstado = cambiarEstadoCupon("En uso",cuponMenorCaducidad.getId());
				if (cambiarEstado==true) {
					System.out.println("BilboSKP: Utilizado un cupon");
					return true;
				} else {
					System.out.println("BilboSKP: Error al utilizar el cupon");
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BilboSKP: Error cambiando el estado del cupon");
		}
		return false;
	}
	//gastar cupon de menor caducidad @Rivo
	public static boolean gastarCupon(int idSuscriptor) throws Throwable {
		try {
			//obtener cupon en uso con menor caducidad
			Cupon cuponMenorCaducidad = comprobarCupon("En uso", idSuscriptor);
			if (cuponMenorCaducidad !=null) {
				//cambiar estado a gastado
				boolean cambiarEstado = cambiarEstadoCupon("Gastado",cuponMenorCaducidad.getId());
				if (cambiarEstado==true) {
					System.out.println("BilboSKP: Gastado un cupon");
					return true;
				} else {
					System.out.println("BilboSKP: Error al gastar cupon");
					return false;
				}
			} else {
				System.out.println("BilboSKP: ERROR: no hay cupones en uso");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BilboSKP: Error cambiando el estado del cupon");
		}
		return false;
	}
	
	// cambiar el estado de todos los cupones cuya fecha caducidad es ayer @Inigo
	public static boolean cambiarEstadoCuponesCaducados() throws Throwable {
		try {
			LocalDate fechaActual = LocalDate.now();
			LocalDate fechaAyer = fechaActual.minusDays(1);
			String sentenciaSQL = "UPDATE cupon SET estado = 'caducado' WHERE fechaCaducidad = '" + fechaAyer + "';";
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println("Se pudo cambiar el estado de los cupones");
				return true;
			} else {
				System.out.println("NO Se pudo cambiar el estado de los cupones");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error cambiando el estado de los cupones");
		}
		return false;
	}

	// otorgar cupon @Rivo
	public static void otorgarCupon(String tipoCupon, int idSuscriptor) throws Throwable {
		try {
			// determinar la fecha de caducidad y la reembolsabilidad del cupon
			java.sql.Date fechaCaducidad;
			int reembolsable;
			switch (tipoCupon) {
			case Cupon.CUPON_RANKING: {
				fechaCaducidad = SQLHelper.getFechaCuponRegular(); // +1 mes de ahora
				reembolsable = 0; // no reembolsable
				break;
			}
			case Cupon.CUPON_REGULAR: {
				fechaCaducidad = SQLHelper.getFechaCuponRegular(); // +1 mes de ahora
				reembolsable = 1; // reembolsable
				break;
			}
			case Cupon.CUPON_BIENVENIDA: {
				fechaCaducidad = SQLHelper.getFechaCuponBienvenida(); // año 2077
				reembolsable = 0; // no reembolsable
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + tipoCupon);
			}
			String[] arrayColumnas = { "idSuscriptor", "fechaCaducidad", "estado", "reembolsable" };
			Object[] arrayValores = { idSuscriptor, fechaCaducidad, "Disponible", reembolsable };
			String sentenciaSQL = SQLHelper.obtenerSentenciaSQLInsert("cupon", arrayColumnas, arrayValores);
			BilboSKP conexion = new BilboSKP();
			System.out.println(sentenciaSQL);
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println("Cupon de " + tipoCupon + " creado");
			} else {
				System.out.println("Cupon de " + tipoCupon + " NO SE HA CREADO");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error creando cupon de bienvenida");
		}

	}

	// dado un suscriptor, actualizar los datos en la BD @Torni
	public static Suscriptor actualizarSuscripcion(Suscriptor suscriptor) throws Throwable {
		String email = suscriptor.getEmail();
		String alias = suscriptor.getAlias();
		String nombre = suscriptor.getNombre();
		String apellidos = suscriptor.getApellidos();
		Date fech_nac = suscriptor.getFech_nac();
		java.util.Date fecha_nac_util = fech_nac;
		java.sql.Date fechaSQL = new java.sql.Date(fecha_nac_util.getTime());
		int telefono = suscriptor.getTelefono();
		String imagen = suscriptor.getImagen();
		int activo = suscriptor.getActivo();
		int idSuscriptor = suscriptor.getIdSuscriptor();
		// hacer sentencia sql select todas las salas
		String sentenciaSQL = "UPDATE suscriptor SET email = '" + email + "' , pass = '" + pass + "' , alias = '"
				+ alias + "' , nombre = '" + nombre + "' , apellidos = '" + apellidos + "' , fech_nac = '" + fechaSQL
				+ "' , telefono = " + telefono + " , imagen = '" + imagen + "' , activo = " + activo
				+ " WHERE idSuscriptor = " + idSuscriptor + ";";
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// hacer consulta sql con la conexion y se guarda en el resultset resultado
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
		if (filasAfectadas == 1) {
			System.out.println("se pudo editar suscriptor");

			return loginSuscriptor(email, pass);
		} else {
			System.out.println("no se pudo editar suscriptor");
			return null;
		}
	}

	// darle de baja a un suscriptor @Torni
	public Suscriptor darBajaSuscripcion(Suscriptor suscriptor) throws Throwable {
		int idSuscriptor = suscriptor.getIdSuscriptor();
		String sentenciaSQL = "UPDATE suscriptor SET  activo =  0  WHERE idSuscriptor = " + idSuscriptor + ";";
		BilboSKP conexion = new BilboSKP();
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
		if (filasAfectadas == 1) {
			System.out.println("Se pudo dar de baja suscriptor");
			ocultarPartidasRanking(idSuscriptor);
			suscriptor.setActivo(0);
			return suscriptor;

		} else {
			System.out.println("No se pudo dar de baja suscriptor");
			return null;
		}
	}

	// ocultar las partidas de un suscriptor @Torni
	public boolean ocultarPartidasRanking(int idSuscriptor) throws Throwable {
		// hacer sentencia sql
		String sentenciaSQL = "UPDATE partidaonline SET visibleRanking = 0  WHERE idSuscriptor = " + idSuscriptor + ";";
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el int
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
		if (filasAfectadas >= 1) {
			System.out.println("Se pudo ocultar partida del ranking");
			return true;
		} else {
			System.out.println("No se pudo ocultar partida del ranking");
			return false;
		}
	}

	// Eliminar una reserva de la BD
	public static void eliminarReserva(int idReserva) throws Throwable {
		String sql = "DELETE from reserva WHERE id=" + idReserva + ";";
	}

	// obtener las reservas de un suscriptor de la bd @Paula
	public static Vector<Reserva> obtenerReserva(int idSuscriptor) throws Throwable {
		Vector<Reserva> reservas = new Vector<Reserva>();
		String sentenciaSQL = "SELECT * FROM reserva WHERE idSuscriptor=" + idSuscriptor + " order by fechaHora ";
		BilboSKP conexion = new BilboSKP();
		ResultSet resultado = conexion.SQLQuery(sentenciaSQL);
		// por cada fila, crear un objeto reserva
		while (resultado.next()) {
			int idReserva = resultado.getInt("idReserva");
			int idSalaFisica = resultado.getInt("idSalaFisica");
			int numJugadores = resultado.getInt("numJugadores");
			Date fechaHora = resultado.getDate("fechaHora");
			int estado = resultado.getInt("estado");

			Reserva reserva = new Reserva(idReserva, idSalaFisica, numJugadores, numJugadores, fechaHora, estado);
			reservas.add(reserva);
		}
		if (reservas.size() > 0) {
			for (int i = 0; i < reservas.size(); i++) {
				Reserva r = reservas.get(i);
				System.out.println(r.getIdReserva());
			}
			return reservas;
		} else {

		}
		return reservas;
	}

	// hacer una nueva reserva de una sala física @Paula
	public static boolean crearReserva(int idSala, int idSuscriptor, int numeroJugadores, LocalDateTime fecha,
			int estado) throws Throwable {
		// hacer sentencia SQL
		String sentenciaSQL = "INSERT INTO reserva ('idSalaFisica', 'idSuscriptor', 'numJugadores', 'fechaHora', 'estado') VALUES("
				+ idSala + "," + idSuscriptor + "," + numeroJugadores + ",'" + fecha + "', " + estado + ");";
		System.out.println(sentenciaSQL);
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);

		if (filasAfectadas == 0) {
			return false;
		} else {
			System.out.println("Ya exsite una reserva");
			return true;
		}
	}

	// este es un metodo que recibe string en vez de localdate @rivo
	public static boolean crearReserva(int idSala, int idSuscriptor, int numeroJugadores, String fecha, int estado)
			throws Throwable {
		// hacer sentencia SQL
		String sentenciaSQL = "INSERT INTO reserva (idSalaFisica, idSuscriptor, numJugadores, fechaHora, estado) VALUES("
				+ idSala + "," + idSuscriptor + "," + numeroJugadores + ",'" + fecha + "', " + estado + ");";
		System.out.println(sentenciaSQL);
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);

		if (filasAfectadas == 0) {
			return false;
		} else {
			System.out.println("Ya exsite una reserva");
			return true;
		}
	}

	// TODO cambiar estado reserva dado su id @Paula
	public static Reserva cambiarEstadoReserva(int nuevoEstado, int idSuscriptor, int idReserva) throws Throwable {
		try {
			String sentenciaSQL = "UPDATE reserva SET estado=" + nuevoEstado + " WHERE idSuscriptor=" + idSuscriptor
					+ " and idReserva=" + idReserva + ";";
			BilboSKP conexion = new BilboSKP();
			int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
			if (filasAfectadas == 1) {
				System.out.println("Se pudo cambiar el estado a la reserva");
			}
		} catch (Exception e) {

		}

		return null;
	}

	// cargar todas las tematicas disponibles @Rivo
	public static void cargarTematicas() {
		ArrayList<String> tematicasCargadas = new ArrayList<String>();
		HashMap<String, Sala> mapaSalas = Sala.getTodasLasSalasCargadas();
		for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			Sala sala = par.getValue();
			String tematica = sala.getTematica();
			// si el array de tematicas cargadas no contiene una tematica, se agrega al
			// arraylist
			if (!tematicasCargadas.contains(tematica)) {
				tematicasCargadas.add(tematica);
			}
		}
		Sala.setTematicasCargadas(tematicasCargadas);
	}

	// cargar todas las dificultades disponibles @Rivo
	public static void cargarDificultades() {
		ArrayList<String> dificultadesCargadas = new ArrayList<String>();
		HashMap<String, Sala> mapaSalas = Sala.getTodasLasSalasCargadas();
		for (Map.Entry<String, Sala> par : mapaSalas.entrySet()) {
			Sala sala = par.getValue();
			String dificultad = sala.getDificultad();
			// si el array de tematicas cargadas no contiene la dificultad, se agrega al
			// arraylist
			if (!dificultadesCargadas.contains(dificultad)) {
				dificultadesCargadas.add(dificultad);
			}
		}
		Sala.setDificultadesCargadas(dificultadesCargadas);
	}

	// cargar toda la info relacionada con salas @Rivo
	public static void cargarInfoSalas() {
		try {
			BilboSKP.cargarSalasFisicas();
			BilboSKP.cargarSalasOnline();
			BilboSKP.cargarTematicas();
			BilboSKP.cargarDificultades();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public static String generarRutaImagenDefault() {
		return "defaults/" + generarNumeroImagen() + ".png";

	}

	public static int generarNumeroImagen() {
		Random rand = new Random();
		int numero = rand.nextInt(8) + 1; // genera un número aleatorio entre 1 y 8
		return numero;
	}

	public static boolean ocultarHoraReservada(int idSala, String fechaSQL) throws Throwable {
		String sentenciaSQL = "UPDATE horario SET disponible = 0  WHERE fechaHora = '" + fechaSQL + "' and idSalaFisica =" + idSala+ ";";
		// hacer una conexion
		BilboSKP conexion = new BilboSKP();
		// se hace una consulta sql con la conexion y se guarda en el int
		int filasAfectadas = conexion.SQLUpdate(sentenciaSQL);
		if (filasAfectadas >= 1) {
			System.out.println("Se pudo reservar");
			return true;
		} else {
			System.out.println("No se pudo reservar");
			return false;
		}

	}

}
