import 'package:test/test.dart';
import '../bin/imc_app.dart';

void main() {
  group('IMC Calculator Tests', () {
    test('Test IMC calculation', () {
      Pessoa pessoa = Pessoa("João", 70, 1.75);
      expect(pessoa.calcularIMC(), closeTo(22.86, 0.01));
    });

    test('Test IMC classification', () {
      Pessoa pessoa1 = Pessoa("Maria", 50, 1.60);
      expect(pessoa1.classificarIMC(15), equals("Magreza Grave"));

      Pessoa pessoa2 = Pessoa("Carlos", 65, 1.80);
      expect(pessoa2.classificarIMC(19), equals("Saudável"));

      Pessoa pessoa3 = Pessoa("Ana", 90, 1.70);
      expect(pessoa3.classificarIMC(35), equals("Obesidade Grau II"));
    });
  });
}
