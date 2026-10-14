// Questão 2 - série S = 3^4! + 5^8! + 7^12! - 9^16! + 11^20! - 13^24! + 15^28! ...
import 'dart:io';

int fatorial(int n) {
  int f = 1;
  for (int i = 2; i <= n; i++) {
    f *= i;
  }
  return f;
}

void main() {
  stdout.write('Número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  BigInt soma = BigInt.zero;

  for (int i = 1; i <= n; i++) {
    int base = 2 * i + 1; // 3, 5, 7, 9...
    int expoente = fatorial(4 * i); // 4!, 8!, 12!...

    // do 3º termo em diante o expoente passa de 479 milhões
    // e o computador não consegue calcular isso
    if (expoente > 100000) {
      print('Parei no termo ${i - 1}: o termo $i ($base^$expoente) é grande demais pra calcular.');
      break;
    }

    BigInt termo = BigInt.from(base).pow(expoente);

    // sinais: + + + - + - + ...
    if (i > 3 && i % 2 == 0) {
      soma -= termo;
    } else {
      soma += termo;
    }
  }

  String resultado = soma.toString();
  if (resultado.length > 50) {
    print('S é um número com ${resultado.length} dígitos, começando com ${resultado.substring(0, 20)}...');
  } else {
    print('S = $resultado');
  }
}
