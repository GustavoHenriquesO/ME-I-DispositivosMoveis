// Questão 17 - soma de dois vetores usando funções
import 'dart:io';

List<int> lerVetor(String nome, int tamanho) {
  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    stdout.write('$nome [${i + 1}]: ');
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

List<int> somarVetores(List<int> a, List<int> b) {
  List<int> resultado = [];
  for (int i = 0; i < a.length; i++) {
    resultado.add(a[i] + b[i]);
  }
  return resultado;
}

int somaDosElementos(List<int> vetor) {
  int soma = 0;
  for (int valor in vetor) {
    soma += valor;
  }
  return soma;
}

void main() {
  stdout.write('Tamanho dos vetores: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> v1 = lerVetor('Vetor 1', tamanho);
  List<int> v2 = lerVetor('Vetor 2', tamanho);

  List<int> v3 = somarVetores(v1, v2);

  print('\nVetor 1: $v1');
  print('Vetor 2: $v2');
  print('Vetor 3 (soma): $v3');
  print('Soma dos elementos do vetor 3: ${somaDosElementos(v3)}');
}
