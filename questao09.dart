// Questão 9 - números de quatro dígitos que satisfazem
// n = (parte esquerda + parte direita)²

void main() {
  for (int numero = 1000; numero <= 9999; numero++) {
    final esquerda = numero ~/ 100;
    final direita = numero % 100;
    final soma = esquerda + direita;

    if (soma * soma == numero) {
      print('$numero = ($esquerda + $direita)² = $soma²');
    }
  }
}
