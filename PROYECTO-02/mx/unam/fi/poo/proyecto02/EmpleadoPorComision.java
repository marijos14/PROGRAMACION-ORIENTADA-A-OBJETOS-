package mx.unam.fi.poo.proyecto02;

public class EmpleadoPorComision extends Empleado {
    private double tarifaComision;
    private int ventasNetas;

    public EmpleadoPorComision(String nombre, String apellidoPaterno, String numeroSeguroSocial, int ventasNetas, double tarifaComision) {
        super(nombre, apellidoPaterno, numeroSeguroSocial);
        setVentasNetas(ventasNetas);
        setTarifaComision(tarifaComision);
    }

    public double getTarifaComision() {
        return tarifaComision;
    }

    public void setTarifaComision(double tarifaComision) {
        if (tarifaComision < 0.0 || tarifaComision > 1.0) {
            System.out.println("No se puede asignar esta tarifa.");
        } else {
            this.tarifaComision = tarifaComision;
        }
    }

    public int getVentasNetas() {
        return ventasNetas;
    }

    public void setVentasNetas(int ventasNetas) {
        if (ventasNetas < 0) {
            System.out.println("No puede haber ventas negativas.");
        } else {
            this.ventasNetas = ventasNetas;
        }
    }

    @Override
    public double ingresos() {
        return tarifaComision * ventasNetas;
    }

    @Override
    public String toString() {
        return "Empleado Por Comision \n" + super.toString() + "\nVentas netas: " + ventasNetas + "\nTarifa: " + tarifaComision + "\nIngresos totales: $" + ingresos();
    }
}