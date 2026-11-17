using System.Net.Mail;

namespace NutriStreak.Models;

public class Usuario
{
    public int Id { get; set; } 

    public string Nome { get; set; } = "";

    public string Email { get; set; } = "";

    public string Senha { get; set; } = "";

    public int Pontos { get; set; } 

    public bool ValidarNome()
    {
        return !string.IsNullOrWhiteSpace(Nome)
                && Nome.Trim().Length <= 16;
    }

    public bool ValidarEmail()
    {
        try
        {
            var endereco = new MailAddress(Email);
            return endereco.Address == Email.Trim();
        }
        catch
        {
            return false;
        }
    }

    public bool ValidarSenha()
    {
        return !string.IsNullOrWhiteSpace(Senha)
                && Senha.Length >= 8;
    }

    public void ExibirInformacoes()
    {
        Console.WriteLine("\n===== DADOS DO USUÁRIO =====");
        Console.WriteLine($"Nome: {Nome}");
        Console.WriteLine($"E-mail: {Email}");
        Console.WriteLine($"Pontos: {Pontos}");
    }
}