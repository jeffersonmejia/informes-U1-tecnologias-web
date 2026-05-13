using System;

class Program {
    static void Main() {

        ControladorEstudiantes controlador =
            new ControladorEstudiantes();

        Estudiante est1 = new Estudiante();

        est1.Nombre = "Juan";
        est1.Nota1 = 80;
        est1.Nota2 = 70;
        est1.Nota3 = 90;

        controlador.AgregarEstudiante(est1);

        Estudiante est2 = new Estudiante();

        est2.Nombre = "Maria";
        est2.Nota1 = 50;
        est2.Nota2 = 40;
        est2.Nota3 = 60;

        controlador.AgregarEstudiante(est2);

        controlador.MostrarTodos();

        Console.WriteLine("Presiona una tecla...");
        Console.ReadKey();

    }
}
