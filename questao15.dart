// Questão 15 - bois da fazenda: pesquisa por intervalo de peso
import 'dart:io';

void main() {
  stdout.write('Quantidade de bois: ');
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];
  List<double> pesos = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Número do boi ${i + 1}: ');
    numeros.add(int.parse(stdin.readLineSync()!));
    stdout.write('Peso do boi ${i + 1} (kg): ');
    pesos.add(double.parse(stdin.readLineSync()!.replaceAll(',', '.')));
  }

  String continuar = 's';

  while (continuar == 's') {
    stdout.write('\nPeso mínimo: ');
    double minimo = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
    stdout.write('Peso máximo: ');
    double maximo = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

    int encontrados = 0;
    for (int i = 0; i < n; i++) {
      if (pesos[i] >= minimo && pesos[i] <= maximo) {
        print('Boi ${numeros[i]} - ${pesos[i]} kg');
        encontrados++;
      }
    }

    if (encontrados == 0) {
      print('Nenhum boi nesse intervalo.');
    }

    stdout.write('\nFazer outra pesquisa? (s/n): ');
    continuar = stdin.readLineSync()!.trim().toLowerCase();
  }
}
