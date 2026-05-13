using System;

class Program {
    static void Main() {

        Estudiante est = new Estudiante();

        est.Nombre = "Juan";
        est.Nota1 = 80;
        est.Nota2 = 70;
        est.Nota3 = 90;

        Console.WriteLine(est.Nombre);
        Console.WriteLine(est.CalcularPromedio());

    }
}
