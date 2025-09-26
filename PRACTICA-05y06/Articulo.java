public class Articulo {
    private String nombre;
    private double precio;

    public Articulo(String nombre, double precio) {
        this.nombre = nombre;
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public String toItemString() {
        long cents = Math.round(precio * 100);
        String entero = String.valueOf(cents/100);
        int dec = (int)(cents % 100);
        String decStr = dec < 10 ? ("0" + dec) : String.valueOf(dec);
        return nombre + " - $" + entero + "." + decStr;
    }
}