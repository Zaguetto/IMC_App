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

  String classificarIMC(double imc) {
    if (imc < 16) {
      return "Magreza Grave";
    } else if (imc < 17) {
      return "Magreza Moderada";
    } else if (imc < 18.5) {
      return "Magreza Leve";
    } else if (imc < 25) {
      return "Saudável";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
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

    print("Digite a altura (em metros, use ponto ou vírgula):");
    String inputAltura = stdin.readLineSync()!.replaceAll(',', '.');
    double altura = double.parse(inputAltura);

    if (altura <= 0) {
      throw ArgumentError("Altura inválida. A altura deve ser maior que zero.");
    }

    Pessoa pessoa = Pessoa(nome, peso, altura);
    double imc = pessoa.calcularIMC();
    String classificacao = pessoa.classificarIMC(imc);

    print("O IMC de ${pessoa.nome} é: $imc");
    print("Classificação: $classificacao");
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
