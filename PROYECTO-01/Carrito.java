import java.util.ArrayList;

public class Carrito {
    String articulo;
    Integer precio;

    public Carrito(String articulo, int precio){
        this.articulo = articulo;
        this.precio = precio;
    }

    public String imprimir(){
        return "Artículo: " + articulo + " Precio: " + precio.toString();
    }

    public static void agregar(ArrayList<Carrito> tuCarrito, Carrito producto){
        tuCarrito.add(producto);
    }
    
    public static void mostrar(ArrayList<Carrito> tuCarrito){
        for(int i = 0; i < tuCarrito.size(); i++){
            System.out.println(tuCarrito.get(i).imprimir());
        }
    }

    public static void quitar(ArrayList<Carrito> tuCarrito, String nombre){
        for(int i = 0; i < tuCarrito.size(); i++){
            if(nombre.equals(tuCarrito.get(i).articulo)){
                tuCarrito.remove(i);
                System.out.println("Se eliminó el producto: " + nombre + "\n");
                return;
            }   
        }
        System.out.println("No se encontró el producto: " + nombre + "\n");
    }
}