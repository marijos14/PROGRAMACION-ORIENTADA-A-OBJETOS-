package mx.unam.fi.poo.p78.RETO;
public class Material {
    private String titulo;
    private String autor;
    private int anio;

    public Material(String titulo, String autor, int anio) {
        setTitulo(titulo);
        setAutor(autor);
        setAnio(anio);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public void mostrarInformacion() {
        System.out.println("Título: " + getTitulo());
        System.out.println("Autor: " + getAutor());
        System.out.println("Año: " + getAnio());
    }
}