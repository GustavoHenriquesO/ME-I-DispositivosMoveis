// Questão 7 - série S = X^2/1! + X^3/2! + X^4/3! + X^5/4! + X^6/3! + X^7/2! + X^8/1! + X^9/2! ...
// os fatoriais seguem o padrão 1, 2, 3, 4, 3, 2 e repetem
import 'dart:io';
import 'dart:math';

int fatorial(int n) {
  int f = 1;
  for (int i = 2; i <= n; i++) {
    f *= i;
  }
  return f;
}

void main() {
  stdout.write('Valor de X: ');
  double x = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
  stdout.write('Número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> padrao = [1, 2, 3, 4, 3, 2];
  double soma = 0;

  for (int i = 0; i < n; i++) {
    int expoente = i + 2;
    int denominador = fatorial(padrao[i % 6]);
    soma += pow(x, expoente) / denominador;
  }

  print('S = $soma');
}
