package view;

public class Mensaje {
	public static final String MENSAJE_ERROR = "ERROR";
	public static final String MENSAJE_EXITO = "EXITO";
	public static final String MENSAJE_INFO = "INFO";
	public String rutaIcono;
	public String texto;
	public String TipoMensaje;
	
	public Mensaje(String texto, String tipoMensaje) {
		super();
		this.texto = texto;
		TipoMensaje = tipoMensaje;
		switch (tipoMensaje) {
		case MENSAJE_ERROR:
			this.rutaIcono=Icon.getIconHTMLClass("reserva");
			break;

		default:
			break;
		}
		
	}
	
	
}



