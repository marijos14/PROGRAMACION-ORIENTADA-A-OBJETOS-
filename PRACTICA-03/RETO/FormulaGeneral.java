import java.util.ArrayList;

public class FormulaGeneral{
    public static void main(String[] args) {
        double x1,x2,re,im,disc;
        ArrayList<Integer> valores = new ArrayList<>();
            for(String e : args){
                 valores.add(Integer.parseInt(e));
            }
            disc = (valores.get(1) * valores.get(1)) - 4 * valores.get(0) * valores.get(2);
            if (disc >= 0) {
                x1= (-valores.get(1)+ Math.sqrt(valores.get(1)*valores.get(1)-4*valores.get(0)*valores.get(2)))/(2.0*valores.get(0));
                x2= (-valores.get(1)- Math.sqrt(valores.get(1)*valores.get(1)-4*valores.get(0)*valores.get(2)))/(2.0*valores.get(0));
                System.out.println("Su polinomio es de la forma: "+valores.get(0)+"x^2"+" + "+valores.get(1)+"x"+" + "+valores.get(2));
                System.out.println("El valor de x1 es: "+ x1);
                System.out.println("El valor de x2 es: "+ x2);
            } else {
                System.out.println("Su polinomio es de la forma: "+valores.get(0)+"x^2"+" + "+valores.get(1)+"x"+" + "+valores.get(2));
                re= -valores.get(1)/(2.0 * valores.get(0));
                im= Math.sqrt(-disc)/(2.0 * valores.get(0));
                System.out.println("Las raíces son complejas:");
                System.out.println("El valor de x1 es: "+ re + " + " + im + "i");
                System.out.println("El valor de x2 es: "+ re + " - " + im + "i");
            }
        }
}