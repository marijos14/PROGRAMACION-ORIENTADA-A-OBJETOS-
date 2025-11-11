package mx.unam.fi.poo.proyecto02;

public class MainApp{
    public static void main (String[] args){

        Empleado empleado = new EmpleadoAsalariado("Karla", "Panini", "223456", 500.8);
        System.out.println(empleado);
        System.out.println();

        empleado = new EmpleadoPorComision("Juan Gabriel", "Aguilera", "909090", 1000000, 0.7);
        System.out.println(empleado);
        System.out.println();

        //Esto se añadió después para el reporte
        empleado = new EmpleadoAsalariado("Jhonny", "Deep", "1515", -14);
        System.out.println(empleado);
        System.out.println();

        empleado = new EmpleadoPorComision("Slim", "Shady", "4444", 500000, 1.5);
        System.out.println(empleado);
        System.out.println();
    }
}
