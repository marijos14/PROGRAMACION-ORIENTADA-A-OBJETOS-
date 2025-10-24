package mx.unam.fi.poo.proyecto02;

public abstract class Empleado{
    private final String nombre;
    private final String apellidoPaterno;
    private final String numSeguroSocial;

    public Empleado(String nombre, String apellidoPaterno, String numeroSeguro) {
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.numSeguroSocial = numeroSeguro;
    }

    public abstract double ingresos();

    @Override
    public String toString(){
        return String.format("%s %s\nNúmero de seguro social: %s", nombre, apellidoPaterno, numSeguroSocial);
    }
}