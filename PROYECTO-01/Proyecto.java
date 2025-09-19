import java.util.Scanner;
import java.util.HashMap;
import java.util.ArrayList;

public class Proyecto {
    public static void main(String[] args){
        Scanner e = new Scanner(System.in);
        Scanner m = new Scanner(System.in);
        int opcion = 0;
        ArrayList <Carrito> tuCarrito = new ArrayList<Carrito>();
        HashMap <Integer,Carrito> productos = new HashMap<Integer,Carrito>();
        Carrito pan = new Carrito("Pan", 10);
        Carrito jabon = new Carrito("Jabón",20);
        Carrito calcetines = new Carrito("Calcetines",30);
        Carrito garrafon = new Carrito("Garrafón",40);
        Carrito libro = new Carrito("Libro",50);

        productos.put(1, pan);
        productos.put(2, jabon);
        productos.put(3, calcetines);
        productos.put(4, garrafon);
        productos.put(5, libro);

        while(opcion != 4){
            System.out.println("Carrito de compras \n");
            System.out.println("Elige una opción:");
            System.out.println("1. Agregar artículo");
            System.out.println("2. Quitar artículo");
            System.out.println("3. Mostrar carrito");
            System.out.println("4. Salir");
            opcion = e.nextInt();
            switch(opcion){
                case 1: //Agregar
                    for(int i = 1; i < 6; i++){
                   System.out.println(i + ". " + productos.get(i).imprimir());
                }
                    System.out.println("Qué producto deseas agregar? \n");
                    int eleccion = e.nextInt();
                    System.out.println();
                    Carrito.agregar(tuCarrito, productos.get(eleccion));
                break;

                case 2: //Quitar
                    System.out.println("Qué producto quieres eliminar? \n");
                    String nombre = m.nextLine();
                    Carrito.quitar(tuCarrito, nombre);                  
                break;

                case 3: //Mostrar
                    System.out.println("Tu carrito contiene: \n");
                    Carrito.mostrar(tuCarrito);
                break;

                case 4: //Salir
                    System.out.println("Terminando el programa... \n");
                break;

                default:
                    System.out.println("Opción inválida... \n");
                break;
            }
        }
        e.close();
        m.close();
    }
}