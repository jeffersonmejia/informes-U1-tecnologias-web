#!/bin/bash

mkdir -p ejercicios-csharp
cd ejercicios-csharp || exit

echo "Creando proyectos..."

dotnet new console -n 01-SaludoBasico
cat > 01-SaludoBasico/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        Console.WriteLine("¿Cuál es tu nombre?");
        string nombre = Console.ReadLine() ?? "";

        Console.WriteLine("Hola " + nombre);

    }
}
EOF

dotnet new console -n 02-MayorDeEdad
cat > 02-MayorDeEdad/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        Console.WriteLine("¿Cuál es tu nombre?");
        string nombre = Console.ReadLine() ?? "";

        Console.WriteLine("¿Cuál es tu edad?");
        int edad = int.Parse(Console.ReadLine() ?? "0");

        if (edad >= 18) {
            Console.WriteLine(nombre + ", eres mayor de edad");
        } else {
            Console.WriteLine(nombre + ", eres menor de edad");
        }

    }
}
EOF

dotnet new console -n 03-ValidacionEdad
cat > 03-ValidacionEdad/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        Console.WriteLine("¿Cuál es tu edad?");

        if (int.TryParse(Console.ReadLine(), out int edad)) {
            Console.WriteLine("Edad válida: " + edad);
        } else {
            Console.WriteLine("Error: Debes escribir un número");
        }

    }
}
EOF

dotnet new console -n 04-PausaConsola
cat > 04-PausaConsola/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        Console.WriteLine("Hola mundo");

        Console.WriteLine("Presiona una tecla para salir...");
        Console.ReadKey();

    }
}
EOF

dotnet new console -n 05-CondicionPromedio
cat > 05-CondicionPromedio/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        float promedio = 75;

        if (promedio >= 70) {
            Console.WriteLine("APROBÓ");
        } else {
            Console.WriteLine("REPROBÓ");
        }

    }
}
EOF

dotnet new console -n 06-BucleFor
cat > 06-BucleFor/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        for (int i = 0; i < 5; i++) {
            Console.WriteLine(i);
        }

    }
}
EOF

dotnet new console -n 07-BucleWhile
cat > 07-BucleWhile/Program.cs << 'EOF'
using System;

class Program {
    static void Main() {

        int contador = 0;

        while (contador < 5) {
            Console.WriteLine(contador);
            contador++;
        }

    }
}
EOF

dotnet new console -n 08-ClaseEstudiante

cat > 08-ClaseEstudiante/Estudiante.cs << 'EOF'
public class Estudiante {

    public string Nombre { get; set; } = "";
    public float Nota1 { get; set; }
    public float Nota2 { get; set; }
    public float Nota3 { get; set; }

    public float CalcularPromedio() {
        return (Nota1 + Nota2 + Nota3) / 3;
    }

    public bool Aprobo() {
        return CalcularPromedio() >= 70;
    }

}
EOF

cat > 08-ClaseEstudiante/Program.cs << 'EOF'
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
EOF

dotnet new console -n 09-ControladorEstudiantes

cat > 09-ControladorEstudiantes/Estudiante.cs << 'EOF'
public class Estudiante {

    public string Nombre { get; set; } = "";
    public float Nota1 { get; set; }
    public float Nota2 { get; set; }
    public float Nota3 { get; set; }

    public float CalcularPromedio() {
        return (Nota1 + Nota2 + Nota3) / 3;
    }

}
EOF

cat > 09-ControladorEstudiantes/ControladorEstudiantes.cs << 'EOF'
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
EOF

cat > 09-ControladorEstudiantes/Program.cs << 'EOF'
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
EOF

dotnet new console -n 10-ProyectoCompletoMVC

cat > 10-ProyectoCompletoMVC/Estudiante.cs << 'EOF'
public class Estudiante {

    public string Nombre { get; set; } = "";
    public float Nota1 { get; set; }
    public float Nota2 { get; set; }
    public float Nota3 { get; set; }

    public float CalcularPromedio() {
        return (Nota1 + Nota2 + Nota3) / 3;
    }

    public bool Aprobo() {
        return CalcularPromedio() >= 70;
    }

}
EOF

cat > 10-ProyectoCompletoMVC/ControladorEstudiantes.cs << 'EOF'
using System;
using System.Collections.Generic;

public class ControladorEstudiantes {

    private List<Estudiante> estudiantes =
        new List<Estudiante>();

    public void AgregarEstudiante(Estudiante est) {
        estudiantes.Add(est);
        Console.WriteLine("Estudiante agregado");
    }

    public void MostrarTodos() {

        foreach (var est in estudiantes) {

            Console.WriteLine("Nombre: " + est.Nombre);
            Console.WriteLine("Promedio: " + est.CalcularPromedio());

            if (est.Aprobo()) {
                Console.WriteLine("APROBÓ");
            } else {
                Console.WriteLine("REPROBÓ");
            }

            Console.WriteLine("----------------");
        }

    }

}
EOF

cat > 10-ProyectoCompletoMVC/Program.cs << 'EOF'
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
EOF

echo "Todos los proyectos fueron creados."