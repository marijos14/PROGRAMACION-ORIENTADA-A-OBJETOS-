import java.util.ArrayList;

public class TrianguloEq{
    public static void main (String args[]){
        ArrayList<Integer> puntos = new ArrayList<Integer>();
        for(String e : args){
            int n = Integer.parseInt(e);
            puntos.add(n);
        }
        double dis1, dis2, dis3;
        dis1 = Math.hypot(puntos.get(0) - puntos.get(2), puntos.get(1) - puntos.get(3));
        dis2 = Math.hypot(puntos.get(0) - puntos.get(4), puntos.get(1) - puntos.get(5));
        dis3 = Math.hypot(puntos.get(2) - puntos.get(4), puntos.get(3) - puntos.get(5));
        
        
    }
}