package mx.unam.fi.poo.reto;

import javax.swing.SwingUtilities;

public class MainApp {

public static void main(String[] args) {

        SwingUtilities.invokeLater(() -> {
            VistaCalculadora vista = new VistaCalculadora("Calculadora");

            for (int i = 0; i <= 9; i++) {
                int numero = i;
                vista.getBotonesNumeros()[i].addActionListener(e -> {
                    String texto = vista.getPantalla().getText();
                    vista.getPantalla().setText(texto + numero);
                });
            }

            vista.getBotonSuma().addActionListener(e -> {
                vista.setOperando1(Double.parseDouble(vista.getPantalla().getText()));
                vista.setOperador("+");
                vista.setEsperandoSegundo(true);
                vista.getPantalla().setText("");
            });

            vista.getBotonResta().addActionListener(e -> {
                vista.setOperando1(Double.parseDouble(vista.getPantalla().getText()));
                vista.setOperador("-");
                vista.setEsperandoSegundo(true);
                vista.getPantalla().setText("");
            });

            vista.getBotonMultiplicacion().addActionListener(e -> {
                vista.setOperando1(Double.parseDouble(vista.getPantalla().getText()));
                vista.setOperador("*");
                vista.setEsperandoSegundo(true);
                vista.getPantalla().setText("");
            });

            vista.getBotonDivision().addActionListener(e -> {
                vista.setOperando1(Double.parseDouble(vista.getPantalla().getText()));
                vista.setOperador("/");
                vista.setEsperandoSegundo(true);
                vista.getPantalla().setText("");
            });

            vista.getBotonIgual().addActionListener(e -> {
                if (!vista.getEsperandoSegundo()) { 
                    return;
                }

                double operando2 = Double.parseDouble(vista.getPantalla().getText());
                double resultado = 0;

                switch (vista.getOperador()) {
                    case "+": 
                        resultado = Operaciones.sumar(vista.getOperando1(), operando2);
                        break;
                    case "-": 
                        resultado = Operaciones.restar(vista.getOperando1(), operando2);
                        break;
                    case "*": 
                        resultado = Operaciones.multiplicar(vista.getOperando1(), operando2);
                        break;
                    case "/":
                        if (operando2 == 0) {
                            vista.getPantalla().setText("Error, no hay división entre 0.");
                            return;
                        }
                        resultado = Operaciones.dividir(vista.getOperando1(), operando2);
                        break;
                }

                vista.getPantalla().setText(String.valueOf(resultado));
                vista.setEsperandoSegundo(false);
            });

            vista.getBotonClear().addActionListener(e -> {
                vista.getPantalla().setText("");
                vista.setOperando1(0);
                vista.setOperador("");
                vista.setEsperandoSegundo(false);
            });

            vista.setVisible(true);
        });
    }
}