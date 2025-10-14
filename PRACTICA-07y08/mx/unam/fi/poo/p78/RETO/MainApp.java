package mx.unam.fi.poo.p78.RETO;

public class MainApp {
    public static void main(String[] args) {
        Libro libro = new Libro("Las batallas en el desierto", "Jose Emilio Pacheco", 1981);
        Revista revista = new Revista("National Geographic", "Varios Autores", 2021);
        DVD dvd = new DVD("Inception", "Christopher Nolan", 2010);

        libro.mostrarInformacion();
        revista.mostrarInformacion();
        dvd.mostrarInformacion();
    }
}
