// Questão 9 - números do tipo 3025 = (30 + 25)^2
// separa o número em duas partes de 2 dígitos, soma e eleva ao quadrado

void main() {
  for (int n = 1000; n <= 9999; n++) {
    int esquerda = n ~/ 100;
    int direita = n % 100;
    int soma = esquerda + direita;

    if (soma * soma == n) {
      print('$n = $esquerda+$direita = $soma*$soma = $n');
    }
  }
}
