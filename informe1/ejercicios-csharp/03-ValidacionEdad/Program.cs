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
