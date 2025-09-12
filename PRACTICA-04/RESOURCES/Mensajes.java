

public class Mensajes {
    Punto puntoA;
    Punto puntoB;
    double distancia;

    public String mensajes(Punto puntoA, Punto puntoB, double distancia){
        return "Punto A: " + puntoA.toString() + "\n" + "Punto B: " + puntoB.toString() + "\n" + "Distancia: " + distancia;
    }
}
