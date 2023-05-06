package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class NombresAleatorios {
    private static final List<String> NOMBRES = Arrays.asList("Lunático", "Caminante", "Osado", "Misterioso", "Audaz");
    private static final List<String> ATRIBUTOS = Arrays.asList("Plateado", "Luminoso", "Ruidoso", "Tenebroso", "Inquietante");

    private final static List<String> nombresDisponibles = new ArrayList<>(NOMBRES.size() * ATRIBUTOS.size());
    private final Random random = new Random();

    static {
        init();
    }

    public static void init() {
        for (String nombre : NOMBRES) {
            for (String atributo : ATRIBUTOS) {
                nombresDisponibles.add(nombre + " " + atributo);
            }
        }
        Collections.shuffle(nombresDisponibles);
    }
    public static void restart() {
    	nombresDisponibles.clear();
    	init();
    }

    public static String getNombreAleatorio() {
        if (nombresDisponibles.isEmpty()) {
        	restart();
        }
        return nombresDisponibles.remove(0);
    }
}