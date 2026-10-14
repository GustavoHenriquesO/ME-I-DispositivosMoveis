// Questão 12 - imprimir um número de trás para frente
import 'dart:io';

void main() {
  stdout.write('Digite um número: ');
  int numero = int.parse(stdin.readLineSync()!);

  String invertido = '';

  // pega o último dígito e vai juntando
  do {
    invertido += (numero % 10).toString();
    numero ~/= 10;
  } while (numero > 0);

  print('Invertido: $invertido');
}
