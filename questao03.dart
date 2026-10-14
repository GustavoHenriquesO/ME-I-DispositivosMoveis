// Questão 3 - série: 1 5 100 2 10 90 4 15 80 8 20 70 ...
// são três sequências misturadas:
//   1, 2, 4, 8...    (dobra)
//   5, 10, 15, 20... (soma 5)
//   100, 90, 80...   (diminui 10)
import 'dart:io';

void main() {
  stdout.write('Quantidade de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  int a = 1;
  int b = 5;
  int c = 100;

  List<int> serie = [];

  for (int i = 0; i < n; i++) {
    if (i % 3 == 0) {
      serie.add(a);
      a *= 2;
    } else if (i % 3 == 1) {
      serie.add(b);
      b += 5;
    } else {
      serie.add(c);
      c -= 10;
    }
  }

  print('S = ${serie.join(' ')}');
}
