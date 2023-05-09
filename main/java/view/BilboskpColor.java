package view;

import java.awt.Color;
import java.util.Iterator;

public class BilboskpColor {
	public static Color colorInicio = new Color(0xa82925);

	public static String obtenerColorDegradado(int numeroVueltas) {
		Color newColor = colorInicio;
		for (int i = 0; i < numeroVueltas; i++) {
			newColor = newColor.darker();
		}
		String colorString = "rgb("+newColor.getRed()+","+newColor.getGreen()+","+newColor.getBlue()+")";
		return colorString;
	}
}
