import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw ArgumentError("Altura inválida. A altura deve ser maior que zero.");
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    print("Digite o nome da pessoa:");
    String? nome = stdin.readLineSync();

    if (nome == null || nome.isEmpty) {
      throw Exception("Nome inválido. Por favor, insira um nome válido.");
    }

    print("Digite o peso (em kg):");
    double peso = double.parse(stdin.readLineSync()!);

    if (peso <= 0) {
      throw ArgumentError("Peso inválido. O peso deve ser maior que zero.");
    }

    print("Digite a altura (em metros):");
    double altura = double.parse(stdin.readLineSync()!);

    if (altura <= 0) {
      throw ArgumentError("Altura inválida. A altura deve ser maior que zero.");
    }

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = pessoa.calcularIMC();

    print("O IMC de ${pessoa.nome} é: $imc");
  } on FormatException catch (e) {
    print("Erro de formatação: $e");
  } on ArgumentError catch (e) {
    print("Argumento inválido: $e");
  } on Exception catch (e) {
    print("Erro: $e");
  } catch (e, s) {
    print("Erro inesperado: $e");
    print("Stack trace: $s");
  }
}
