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
