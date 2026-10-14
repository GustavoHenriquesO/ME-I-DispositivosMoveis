// Questão 14 - juntar dois vetores ordenados em um terceiro também ordenado
import 'dart:io';

List<int> lerVetorOrdenado(String nome) {
  stdout.write('Tamanho do $nome: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];
  int i = 0;
  while (i < tamanho) {
    stdout.write('$nome [${i + 1}]: ');
    int valor = int.parse(stdin.readLineSync()!);

    // o vetor precisa estar em ordem crescente
    if (vetor.isNotEmpty && valor < vetor.last) {
      print('O vetor deve estar ordenado, digite um valor maior ou igual a ${vetor.last}.');
      continue;
    }

    vetor.add(valor);
    i++;
  }
  return vetor;
}

void main() {
  List<int> v1 = lerVetorOrdenado('Vetor 1');
  print('');
  List<int> v2 = lerVetorOrdenado('Vetor 2');

  List<int> v3 = [];
  int i = 0;
  int j = 0;

  while (i < v1.length && j < v2.length) {
    if (v1[i] <= v2[j]) {
      v3.add(v1[i]);
      i++;
    } else {
      v3.add(v2[j]);
      j++;
    }
  }

  // sobras de algum dos vetores
  while (i < v1.length) {
    v3.add(v1[i]);
    i++;
  }
  while (j < v2.length) {
    v3.add(v2[j]);
    j++;
  }

  print('\nVetor 1: $v1');
  print('Vetor 2: $v2');
  print('Vetor 3 (ordenado): $v3');
}
