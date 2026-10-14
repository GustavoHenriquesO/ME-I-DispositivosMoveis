// Questão 13 - contar quantas vezes cada número se repete
import 'dart:io';

void main() {
  stdout.write('Quantidade de números (N): ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];
  for (int i = 0; i < n; i++) {
    stdout.write('Número ${i + 1}: ');
    vetor.add(int.parse(stdin.readLineSync()!));
  }

  // o Map guarda na ordem em que os números aparecem
  Map<int, int> contagem = {};
  for (int valor in vetor) {
    contagem[valor] = (contagem[valor] ?? 0) + 1;
  }

  print('\nVetor lido: ${vetor.join(' ')}');
  print('Resultado:');
  contagem.forEach((numero, vezes) {
    print('$numero – $vezes');
  });
}
