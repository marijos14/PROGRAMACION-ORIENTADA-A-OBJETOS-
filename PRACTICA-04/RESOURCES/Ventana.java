import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    Punto puntoA;
    Punto puntoB;
    double distancia;
    
    public Ventana(Punto puntoA, Punto puntoB, double distancia) {

        this.puntoA = puntoA;
        this.puntoB = puntoB;
        this.distancia = distancia;

        setTitle("Distancia entre dos puntos");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Mostrar distancia");

        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String mensaje = "Punto A: " + puntoA.toString() + "\n" + "Punto B: " + puntoB.toString() + "\n" + "Distancia: " + distancia;
                JOptionPane.showMessageDialog(null, mensaje);
            }
        });

        add(boton);
    }
}