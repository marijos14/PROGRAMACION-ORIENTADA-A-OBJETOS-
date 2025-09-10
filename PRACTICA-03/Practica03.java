import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

public class Practica03{
    public static void main(String[] args) {
        ArrayList<String> entradas = new ArrayList<>();
        for(String e : args){//iterar en args para llenar entradas
            entradas.add(e);
        }

        HashMap <String,String> map = new HashMap<>(); 

        for(String e: entradas){
            String hasht=generaHash(e);
            map.put(e,hasht);
        }

        //System.out.println(map.keySet());
        for(String e : entradas){
            System.out.println(map.get(e) + "   " + e);
        }

    }

    public static String generaHash(String texto){
        //Crea la semilla
        int semilla=0;
        for(char c:texto.toCharArray()){
            semilla+=c;
        }
        Random random = new Random(semilla);

        //simular MD5
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<32;i++){
            int valor = random.nextInt(16);//0-f
            sb.append(Integer.toHexString(valor));
        }
        return sb.toString();
    }
}
