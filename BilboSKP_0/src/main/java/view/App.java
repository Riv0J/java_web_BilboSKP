package view;

import java.util.Date;

import control.BilboSKP;
import model.PartidaOnline;
import model.SalaOnline;
import model.Suscriptor;

public class App {

	public static void main(String[] args) {
		try {
			BilboSKP.cargarSalasOnline();
			BilboSKP.crearSuscripcion("admin", "admin", 7, "administrador", "Bilbo", "SKP", "2023-10-10");
			Suscriptor sus = BilboSKP.loginSuscriptor("admin", "admin");
			if (sus!=null) {
				PartidaOnline PO = new PartidaOnline(SalaOnline.getSalaPorId(1),sus,4,"PRESTOS");
				BilboSKP.guardarPartidaOnline(PO);
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}

}
