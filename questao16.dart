// Questão 16 - quatro vetores: junção ordenada e interseção
import 'dart:io';

List<int> lerVetor(int numero) {
  stdout.write('Tamanho do vetor $numero: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    stdout.write('Vetor $numero [${i + 1}]: ');
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

void main() {
  List<int> v1 = lerVetor(1);
  List<int> v2 = lerVetor(2);
  List<int> v3 = lerVetor(3);
  List<int> v4 = lerVetor(4);

  // a) quinto vetor com todos os valores, em ordem
  List<int> v5 = [];
  v5.addAll(v1);
  v5.addAll(v2);
  v5.addAll(v3);
  v5.addAll(v4);
  v5.sort();

  // b) valores que aparecem nos 4 vetores
  List<int> intersecao = [];
  for (int valor in v1) {
    if (v2.contains(valor) &&
        v3.contains(valor) &&
        v4.contains(valor) &&
        !intersecao.contains(valor)) {
      intersecao.add(valor);
    }
  }

  print('\na) Quinto vetor ordenado: $v5');

  if (intersecao.isEmpty) {
    print('b) Não há elementos em comum nos 4 vetores');
  } else {
    print('b) Elementos em comum: $intersecao');
  }
}
