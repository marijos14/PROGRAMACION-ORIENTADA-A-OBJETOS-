import java.util.Scanner;
public class trianguloPascal{
    public static void main(String[] args) {
        Scanner esc=new Scanner(System.in);
        System.out.println("¿cuantas filas del triangulo desea ver?");
        int filas=esc.nextInt();
        esc.close();
        trianguloCrea(filas);
    }
    public static void trianguloCrea(int fil){
       int[][] aux=new int[fil][fil];
       int f, r;
       for(f=0;f<fil;f++){
           
           for(r=0;r<=f;r++){
                if(r==0){
                  aux[f][r]=1;
                                      
                    }
            
                else if(r==f){
                    
                    aux[f][r]=1;




                }
                else{
                    aux[f][r]=aux[(f-1)][r]+aux[(f-1)][(r-1)];
                }
            }
         }
         for(f=0;f<fil;f++){
             for(int t=fil;t>f;t--){
                 System.out.print("  ");
             }
            for(r=0;r<=f;r++){
                if(aux[f][r]>9){
              System.out.print(aux[f][r]+"  ");
                }
                else{
                    System.out.print(aux[f][r]+"   ");
                }
           }
           System.out.println("");
         }
}


}







