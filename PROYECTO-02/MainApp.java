package mx.unam.fi.poo.proyecto02;

public class MainApp{
    public static void main (String[] args){

        Empleado empleado = new EmpleadoAsalariado("Karla", "Panini", "223456", 500.8);
        System.out.println(empleado);

        empleado = new EmpleadoPorComision("Juan Gabriel", "Aguilera", "909090", 1000000, 0.7);
        System.out.println(empleado);
    }
}