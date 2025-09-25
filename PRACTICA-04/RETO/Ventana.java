import javax.swing.*;
import java.awt.event.*;

public class Ventana extends JFrame {
    JButton boton;
     public Ventana(Mensajes men) {

        setTitle("¿Tu triángulo es equilátero?");
        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        boton = new JButton("Mostrar");

        boton.addActionListener(new ActionListener() {
            @Override
        
            public void actionPerformed(ActionEvent e) {
                String m = men.mensaje();
                JOptionPane.showMessageDialog(null, m);
            }
        });

        add(boton);
    }
}