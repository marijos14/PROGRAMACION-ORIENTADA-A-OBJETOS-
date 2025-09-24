import java.util.ArrayList;

public class TrianguloEq{
    public static void main (String args[]){
        ArrayList<Double> puntos = new ArrayList<Double>();
        for(String e : args){
            Double n = Double.parseDouble(e);
            puntos.add(n);
        }
        double dis1, dis2, dis3;
        dis1 = Math.hypot(puntos.get(0) - puntos.get(2), puntos.get(1) - puntos.get(3));
        dis2 = Math.hypot(puntos.get(0) - puntos.get(4), puntos.get(1) - puntos.get(5));
        dis3 = Math.hypot(puntos.get(2) - puntos.get(4), puntos.get(3) - puntos.get(5));
        Mensajes mens= new Mensajes(dis1, dis2, dis3);
        Ventana ventana = new Ventana(mens);
        ventana.setVisible(true);
        
    }
}