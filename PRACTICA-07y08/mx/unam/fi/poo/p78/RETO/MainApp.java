package mx.unam.fi.poo.p78.RETO;

public class MainApp {
    public static void main(String[] args) {
        Material material;

        material = new Libro("Las batallas en el desierto", "José Emilio Pacheco", 1981);
        material.mostrarInformacion();

        material = new Revista("National Geographic", "Varios Autores", 2021);
        material.mostrarInformacion();

        material = new DVD("Inception", "Christopher Nolan", 2010);
        material.mostrarInformacion();        
    }
}