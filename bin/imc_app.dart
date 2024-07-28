import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw Exception("Altura inválida. A altura deve ser maior que zero.");
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    print("Digite o nome da pessoa:");
    String nome = stdin.readLineSync()!;

    print("Digite o peso (em kg):");
    double peso = double.parse(stdin.readLineSync()!);

    print("Digite a altura (em metros):");
    double altura = double.parse(stdin.readLineSync()!);

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = pessoa.calcularIMC();

    print("O IMC de ${pessoa.nome} é: $imc");
  } catch (e) {
    print("Ocorreu um erro: $e");
  }
}
