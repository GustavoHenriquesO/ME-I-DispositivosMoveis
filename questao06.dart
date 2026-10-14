// Questão 6 - jogo de adivinhar o número entre 1 e 100
import 'dart:io';
import 'dart:math';

void main() {
  int sorteado = Random().nextInt(100) + 1;
  int menor = 0;
  int maior = 101;
  int tentativas = 0;

  print('Adivinhe o número entre 1 e 100!');

  while (true) {
    stdout.write('Seu palpite: ');
    int chute = int.parse(stdin.readLineSync()!);

    // palpite fora do intervalo atual não conta
    if (chute <= menor || chute >= maior) {
      print('Esse número está fora do intervalo, tente de novo.');
      continue;
    }

    tentativas++;

    if (chute == sorteado) {
      print('Acertou! O número era $sorteado ($tentativas tentativas).');
      break;
    } else if (chute < sorteado) {
      menor = chute;
    } else {
      maior = chute;
    }

    print('O número está entre $menor e $maior');
  }
}
