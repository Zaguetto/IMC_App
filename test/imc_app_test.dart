import 'package:test/test.dart';
import '../bin/imc_app.dart';

void main() {
  test('Calculo de IMC', () {
    Pessoa pessoa = Pessoa('Joao', 70.0, 1.75);
    expect(pessoa.calcularIMC(), closeTo(22.86, 0.01));
  });
}
