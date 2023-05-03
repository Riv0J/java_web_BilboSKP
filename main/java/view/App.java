package view;

import java.util.Date;

import control.BilboSKP;
import model.Cupon;
import model.PartidaOnline;
import model.SalaOnline;
import model.Suscriptor;

public class App {

	public static void main(String[] args) {
		try {
			BilboSKP.cargarSalasOnline();
			Suscriptor sus = BilboSKP.loginSuscriptor("admin", "admin");
			if (sus!=null) {
				PartidaOnline PO = new PartidaOnline(SalaOnline.getSalaPorId(1),sus,4,"PRESTOS");
				BilboSKP.guardarPartidaOnline(PO);
				BilboSKP.agregarSuscriptorParticipante(4, 13);
			}
			BilboSKP.otorgarCupon(Cupon.CUPON_RANKING,4);
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}

}
