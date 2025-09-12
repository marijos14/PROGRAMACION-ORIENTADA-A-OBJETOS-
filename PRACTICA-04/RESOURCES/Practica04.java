public class Practica04 {
    public static void main(String[] args) {
        int x1 = Integer.parseInt(args[0]);
        int y1 = Integer.parseInt(args[1]);
        int x2 = Integer.parseInt(args[2]);
        int y2 = Integer.parseInt(args[3]);
        double distancia = Math.hypot(x2 - x1, y2 - y1);

        Punto puntoA = new Punto(x1, y1);
        Punto puntoB = new Punto(x2, y2);

        Ventana ventana = new Ventana(puntoA, puntoB, distancia);
        ventana.setVisible(true);
    }
}