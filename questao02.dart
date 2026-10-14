// Questão 2 - série: 3^4! + 5^8! + 7^12! - 9^16! + 11^20! - 13^24! + ...
import 'dart:io';

int fatorial(int n) {
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}

void main() {
  stdout.write('Número de termos: ');
  final entrada = stdin.readLineSync();
  final n = int.tryParse(entrada ?? '');

  if (n == null || n < 1) {
    print('Digite uma quantidade de termos maior que zero.');
    return;
  }

  BigInt soma = BigInt.zero;

  for (int i = 1; i <= n; i++) {
    final base = 2 * i + 1;
    final expoente = fatorial(4 * i);

    // Os expoentes crescem muito rápido. A partir do terceiro termo,
    // o cálculo exato torna-se impraticável com BigInt.pow.
    if (expoente > 100000) {
      print('Não foi possível calcular o termo $i ($base^$expoente): '
          'o expoente é grande demais para esta implementação.');
      print('Soma parcial dos ${i - 1} termos anteriores:');
      print(soma);
      return;
    }

    final termo = BigInt.from(base).pow(expoente);

    // Os três primeiros termos são positivos; depois os sinais alternam.
    if (i <= 3 || i.isOdd) {
      soma += termo;
    } else {
      soma -= termo;
    }
  }

  print('Soma = $soma');
}
