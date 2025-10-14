public class Mensajes {
    double dis1, dis2, dis3;
    public Mensajes(double dis1, double dis2, double dis3){
        this.dis1=dis1;
        this.dis2=dis2;
        this.dis3=dis3;
        }
    public String mensaje() {
        if(dis1==dis2&&dis2==dis3){
            return "Tu triángulo es equilátero c:";
        }
        else{
            return "Tu triángulo no es equilátero D:";
        }
    }   
}