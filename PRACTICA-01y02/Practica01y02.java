import java.util.Scanner;

public class Practica01y02 {
    public static void main(String[] args) {
        Scanner e = new Scanner(System.in);
        int opcion = 0;

        while (opcion != 4) {
            System.out.println("Menú:");
            System.out.println("1. Factorial");
            System.out.println("2. Fibonacci");
            System.out.println("3. Collatz");
            System.out.println("4. Salir");
            System.out.println("Elige una opción: ");
            opcion = e.nextInt();

            switch (opcion) {
                case 1:
                    System.out.println("Seleccionaste Factorial");
                    System.out.print("¿De qué numero quieres calcular el factorial? ");
                    int num = e.nextInt();
                    int result = factorial(num); 
                    System.out.println("El factorial de " + num + " es: " + result);
                    break;
                case 2:
                    System.out.println("Seleccionaste Fibonacci");
                    System.out.println("Término que deseas ver: ");
                    int n1 = e.nextInt();
                    fibo(n1);
                    break;
                case 3:
                    System.out.println("Seleccionaste Collatz");
                    System.out.println("Ingrese un numero:");
                    int n3 = e.nextInt();
                    coll(n3);
                    break;
                case 4:
                    System.out.println("Saliendo del programa...");
                    break;
                default:
                    System.out.println("Opción no válida");
            }
            System.out.println();
        }
        e.close();
    }
    public static void coll(int n){
        if(n==1){
            System.out.println(" "+n);
            return;
        }else if(n%2==0){
            System.out.println(" "+n);
            n=n/2;
            coll(n);
        }else{
            System.out.println(" "+n);
            n=(n*3)+1;
            coll(n);
        }    
    }
    public static void fibo(int n1) {
        int a = 0, b = 1;
        System.out.println("Sucesión de Fibonacci:");
        for (int i = 0; i < n1; i++) {
            System.out.print(a + " ");
            int siguiente = a + b;
            a = b;
            b = siguiente;
        }
        return;

    }
    public static int factorial(int n) {
        if(n == 1 || n == 0) {
            return 1;
        }
        else {
            n = n * factorial(n-1);
        } 
        return n;
    }
}
