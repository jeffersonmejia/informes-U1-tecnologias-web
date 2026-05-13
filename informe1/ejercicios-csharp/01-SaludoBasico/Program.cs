using System;

class Program {
    static void Main() {

        Console.WriteLine("¿Cuál es tu nombre?");
        string nombre = Console.ReadLine() ?? "";

        Console.WriteLine("Hola " + nombre);

    }
}
