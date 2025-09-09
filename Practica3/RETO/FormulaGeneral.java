import java.util.ArrayList;

public class FormulaGeneral{
    public static void main(String[] args) {
        double x1,x2;
        ArrayList<Integer> valores = new ArrayList<>();
            for(String e : args){
                 valores.add(Integer.parseInt(e));
            }
        x1= (-valores.get(1)+ Math.sqrt(valores.get(1)*valores.get(1)-4*valores.get(0)*valores.get(2)))/(2*valores.get(0));
        x2= (-valores.get(1)- Math.sqrt(valores.get(1)*valores.get(1)-4*valores.get(0)*valores.get(2)))/(2*valores.get(0));
        System.out.println("su polinomioes de la forma: "+valores.get(0)+"x^2"+"+"+valores.get(1)+"x"+"+"+valores.get(2));
        System.out.println("el valo de x1 es:"+ x1);
        System.out.println("el valo de x2 es:"+ x2);
    }
}
