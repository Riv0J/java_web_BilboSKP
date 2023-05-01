package connection;

import java.util.Calendar;

public class SQLHelper {

	// convertir de java.util.Date a java.sql.Date
	public static java.sql.Date convertirFechaUtilASql(java.util.Date fechaUtil) {
		try {
			long tiempoEnMilis = fechaUtil.getTime();
			java.sql.Date fechaSql = new java.sql.Date(tiempoEnMilis);
			return fechaSql;
		} catch (Exception e) {
			return null;
		}

	}

	// obtener la sentencia sql dados la tabla indicada y el vector de columnas y de
	// valores
	public static String obtenerSentenciaSQLInsert(String nombreTabla, String[] vectorColumnas,
			Object[] vectorValores) {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("INSERT INTO ").append(nombreTabla).append(" (");

		for (int i = 0; i < vectorColumnas.length; i++) {
			stringBuilder.append(vectorColumnas[i]);
			if (i < vectorColumnas.length - 1) {
				stringBuilder.append(", ");
			}
		}
		stringBuilder.append(") VALUES (");
		for (int i = 0; i < vectorValores.length; i++) {
			if (vectorValores[i] instanceof String) {
				stringBuilder.append("'").append(vectorValores[i]).append("'");
			} else if (vectorValores[i] instanceof java.sql.Date) {
				stringBuilder.append("'").append(vectorValores[i].toString()).append("'");
			} else {
				stringBuilder.append(vectorValores[i]);
			}
			if (i < vectorValores.length - 1) {
				stringBuilder.append(", ");
			}
		}

		stringBuilder.append(")");

		return stringBuilder.toString();
	}

	public static java.sql.Date getFechaFinPruebaSQL(java.util.Date fechaUtilInicio) {
		// Convertir la fecha a un objeto Calendar
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fechaUtilInicio);

		// Agregar 60 minutos a la fecha
		calendar.add(Calendar.MINUTE, 60);

		// Convertir el objeto Calendar resultante a una fecha
		java.util.Date fechaUtilFin = calendar.getTime();

		return convertirFechaUtilASql(fechaUtilFin);
	}

	public static java.sql.Date getFechaCuponRegular() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 1);
		java.util.Date fechaUtil = cal.getTime();
		java.sql.Date fechaSql = convertirFechaUtilASql(fechaUtil);
		return fechaSql;
	}

	public static java.sql.Date getFechaCuponBienvenida() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 2077);
		cal.set(Calendar.MONTH, Calendar.DECEMBER);
		cal.set(Calendar.DAY_OF_MONTH, 31);
		java.util.Date fechaUtil = cal.getTime();
		java.sql.Date fechaSql = convertirFechaUtilASql(fechaUtil);
		return fechaSql;
	}
	public static java.sql.Date getFechaAhoraSQL(){
		java.util.Date ahora = new java.util.Date();
		return convertirFechaUtilASql(ahora);
	}
}
