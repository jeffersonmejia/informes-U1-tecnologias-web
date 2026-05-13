public class Estudiante {

    public string Nombre { get; set; } = "";
    public float Nota1 { get; set; }
    public float Nota2 { get; set; }
    public float Nota3 { get; set; }

    public float CalcularPromedio() {
        return (Nota1 + Nota2 + Nota3) / 3;
    }

}
