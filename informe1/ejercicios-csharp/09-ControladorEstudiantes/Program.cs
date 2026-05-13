using System;
class Program {
    static void Main() {
        ControladorEstudiantes controlador =
            new ControladorEstudiantes();
        Estudiante est = new Estudiante();
        est.Nombre = "Juan";
        est.Nota1 = 80;
        est.Nota2 = 70;
        est.Nota3 = 90;
        controlador.AgregarEstudiante(est);
        controlador.MostrarTodos();

    }
}
