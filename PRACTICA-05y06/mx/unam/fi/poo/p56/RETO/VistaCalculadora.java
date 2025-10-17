package mx.unam.fi.poo.reto;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridLayout;
import javax.swing.*;

public class VistaCalculadora extends JFrame{

    private final JTextField pantalla;
    private final JButton[] botonesNumeros;
    private final JButton botonSuma;
    private final JButton botonResta;
    private final JButton botonMultiplicacion;
    private final JButton botonDivision;
    private final JButton botonIgual;
    private final JButton botonClear;
    private double operando1;
    private String operador = "";
    private boolean esperandoSegundo = false;

    public VistaCalculadora(String titulo) {
        super(titulo);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setPreferredSize(new Dimension(640, 420));
        setLayout(new BorderLayout(10, 10));

        pantalla = new JTextField();
        pantalla.setEditable(false);
        add(pantalla, BorderLayout.NORTH);

        JPanel panelBotones = new JPanel(new GridLayout(4, 4, 6, 6));
        botonesNumeros = new JButton[10];

        for (int i = 0; i <= 9; i++) {
            botonesNumeros[i] = new JButton(String.valueOf(i));
        }

        botonSuma = new JButton("+");
        botonResta = new JButton("-");
        botonMultiplicacion = new JButton("*");
        botonDivision = new JButton("/");
        botonIgual = new JButton("=");
        botonClear = new JButton("C");

        panelBotones.add(botonesNumeros[7]);
        panelBotones.add(botonesNumeros[8]);
        panelBotones.add(botonesNumeros[9]);
        panelBotones.add(botonDivision);
        panelBotones.add(botonesNumeros[4]);
        panelBotones.add(botonesNumeros[5]);
        panelBotones.add(botonesNumeros[6]);
        panelBotones.add(botonMultiplicacion);
        panelBotones.add(botonesNumeros[1]);
        panelBotones.add(botonesNumeros[2]);
        panelBotones.add(botonesNumeros[3]);
        panelBotones.add(botonResta);
        panelBotones.add(botonesNumeros[0]);
        panelBotones.add(botonClear);
        panelBotones.add(botonIgual);
        panelBotones.add(botonSuma);

        add(panelBotones, BorderLayout.CENTER);
        pack();
        setLocationRelativeTo(null);
    }

    public JTextField getPantalla() { 
        return pantalla; 
    }

    public JButton[] getBotonesNumeros() { 
        return botonesNumeros; 
    }

    public JButton getBotonSuma() { 
        return botonSuma; 
    }

    public JButton getBotonResta() { 
        return botonResta; 
    }

    public JButton getBotonMultiplicacion() { 
        return botonMultiplicacion; 
    }

    public JButton getBotonDivision() { 
        return botonDivision; 
    }

    public JButton getBotonIgual() { 
        return botonIgual; 
    }

    public JButton getBotonClear() { 
        return botonClear; 
    }

    public double getOperando1() { 
        return operando1; 
    }

    public void setOperando1(double operando1) { 
        this.operando1 = operando1; 
    }

    public String getOperador() { 
        return operador; 
    }

    public void setOperador(String operador) { 
        this.operador = operador; 
    }

    public boolean getEsperandoSegundo() { 
        return esperandoSegundo; 
    }

    public void setEsperandoSegundo(boolean esperandoSegundo) { 
        this.esperandoSegundo = esperandoSegundo; 
    }
}