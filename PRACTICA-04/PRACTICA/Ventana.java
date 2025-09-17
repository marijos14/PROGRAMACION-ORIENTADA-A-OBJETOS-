import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
    
    public Ventana(Punto puntoA, Punto puntoB, double distancia, Mensajes men) {

        setTitle("Distancia entre dos puntos");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Mostrar distancia");

        boton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String m = men.mensajes(puntoA, puntoB, distancia);
                JOptionPane.showMessageDialog(null, m);
            }
        });

        add(boton);
    }
}