using System;

class Programa
{
    public void Saludar()
    {
        Console.WriteLine("¡Hola a todos!");
    }

    static void Main(string[] args)
    {
        Programa p = new Programa();
        p.Saludar();
    }
}