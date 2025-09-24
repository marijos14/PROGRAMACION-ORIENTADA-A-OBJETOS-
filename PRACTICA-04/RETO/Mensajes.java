public class Mensajes {
    double dis1, dis2, dis3;
    public Mensajes(double dis1, double dis2, double dis3){
        this.dis1=dis1;
        this.dis2=dis2;
        this.dis3=dis3;
        }
    public String mensaje() {
        if(dis1==dis2&&dis2==dis3){
            return "tu triangulo es equilatero c:";
        }
        else{
            return "tu triangulo no es equilatero D:";
        }

    }   
}