package mx.unam.fi.poo.p78.RETO;

public class DVD extends Material{
    private String articulo = "DVD";

    public DVD(String titulo, String autor, int anio) {
        super(titulo, autor, anio);
    }

    public String getArticulo() {
        return articulo;
    }

    @Override 
    public void mostrarInformacion() {
        System.out.println("Artículo: " + getArticulo());
        System.out.println("Datos: ");
        super.mostrarInformacion();
    }
}