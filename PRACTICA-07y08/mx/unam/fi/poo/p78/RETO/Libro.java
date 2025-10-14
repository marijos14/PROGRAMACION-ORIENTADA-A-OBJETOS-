package mx.unam.fi.poo.p78.RETO;
public class Libro extends Material{
    private String articulo="Libro";
    public Libro(String titulo, String autor, int anio) {
        super(titulo, autor, anio);
    }
    public String getArticulo() {
        return articulo;
    }
    @Override   
     public void mostrarInformacion() {
        System.out.println("articulo: "+getArticulo());
        System.out.print(" datos: ");
        super.mostrarInformacion();
    }
}
