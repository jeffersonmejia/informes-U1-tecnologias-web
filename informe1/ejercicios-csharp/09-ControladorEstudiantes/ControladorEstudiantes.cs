using System;
using System.Collections.Generic;

public class ControladorEstudiantes {

    private List<Estudiante> estudiantes =
        new List<Estudiante>();

    public void AgregarEstudiante(Estudiante est) {
        estudiantes.Add(est);
    }

    public void MostrarTodos() {

        foreach (var est in estudiantes) {
            Console.WriteLine(est.Nombre);
            Console.WriteLine(est.CalcularPromedio());
        }

    }

}
