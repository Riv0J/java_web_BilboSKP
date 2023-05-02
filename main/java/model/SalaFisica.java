package model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.MonthDay;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;

import control.BilboSKP;
import view.DateHelper;

public class SalaFisica extends Sala {
	// este hashmap contendra todas las salas fisicas disponibles @Rivo
	private static HashMap<Integer, SalaFisica> salasFisicasCargadas = new HashMap<Integer, SalaFisica>();

	private String direccion;
	private int telefono;
	private Vector<Horario> vectorHorariosDisponibles = new Vector<Horario>();

	public SalaFisica(int idSala, String nombre, String dificultad, String tematica, String descripcion, int tiempoMax,
			int jugadoresMin, int jugadoresMax, int edad_recomendada, String direccion, int telefono) {
		super(idSala, nombre, dificultad, tematica, descripcion, tiempoMax, jugadoresMin, jugadoresMax,
				edad_recomendada);
		this.direccion = direccion;
		this.telefono = telefono;
	}
	public Vector<LocalDate> getFechasAMostrar() {
	    Date ahora = new Date();
	    LocalDate hoy = LocalDate.now();
	    Vector<LocalDate> fechasAMostrar = new Vector<LocalDate>();
	    for (Horario horario: vectorHorariosDisponibles) {
	        LocalDate diaHorario = horario.getFechaHora().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        if(!fechasAMostrar.contains(diaHorario)) {
	            fechasAMostrar.add(diaHorario);
	        }
	    }
	    return fechasAMostrar;
	}
	public Vector<Horario> getVectorHorariosDisponibles() {
		return vectorHorariosDisponibles;
	}

	// tratar de obtener los horarios de una fecha concreta
	public Vector<Horario> getVectorHorariosDisponibles(LocalDate localDateSeleccionada) {
		if(localDateSeleccionada==null) { return null; }
		System.out.println("Obteniendo horarios para "+view.StringHelper.getLocalDateString(localDateSeleccionada)+" en la sala "+this.getNombre());
	    Vector<Horario> horariosAMostrar = new Vector<Horario>();
	    for (Horario horario : vectorHorariosDisponibles) {
	        if (horario.isDisponible()==false) {
	        	System.out.println("Horario no disponible");
	            continue;
	        }
	        LocalDateTime fechaHora = horario.getFechaHora().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
	        if (fechaHora.toLocalDate().isEqual(localDateSeleccionada)) {
	            horariosAMostrar.add(horario);
	        }
	    }
	    return horariosAMostrar;
	}

	public void setVectorHorariosDisponibles(Vector<Horario> vectorHorariosDisponibles) {
		this.vectorHorariosDisponibles = vectorHorariosDisponibles;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public static void setSalasCargadas(HashMap<Integer, SalaFisica> salasPorCargar) {
		salasFisicasCargadas = salasPorCargar;
	}

	public static HashMap<Integer, SalaFisica> getSalasCargadas() {
		// si no hay salas fisica cargadas, trata de consultarlas de nuevo y
		// establecerlas
		if (salasFisicasCargadas.size() == 0) {
			try {
				BilboSKP.cargarSalasFisicas();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return salasFisicasCargadas;
	}

	public static void clearSalasCargadas() {
		salasFisicasCargadas.clear();
	}

	public static SalaFisica datosSalaFisica(String idSala) {
		SalaFisica salafisica = (SalaFisica) salasFisicasCargadas.get(idSala);
		return salafisica;
	}
}
