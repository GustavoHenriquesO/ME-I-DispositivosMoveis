// Questão 5 - recém-nascidos da maternidade (flag: nome FIM)
import 'dart:io';

void main() {
  int baixo = 0;
  int normal = 0;
  int alto = 0;
  int total = 0;

  double maiorPesoF = -1;
  String nomeMaiorF = '';

  while (true) {
    stdout.write('Nome do recém-nascido (FIM para encerrar): ');
    String nome = stdin.readLineSync()!.trim();
    if (nome.toUpperCase() == 'FIM') break;

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    stdout.write('Peso (kg): ');
    double peso = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

    String classificacao;
    if (peso <= 2) {
      classificacao = 'Baixo Peso';
      baixo++;
    } else if (peso <= 4) {
      classificacao = 'Normal';
      normal++;
    } else {
      classificacao = 'Alto Peso';
      alto++;
    }
    total++;

    print('Nome: $nome | Sexo: $sexo | Classificação: $classificacao\n');

    if (sexo == 'F' && peso > maiorPesoF) {
      maiorPesoF = peso;
      nomeMaiorF = nome;
    }
  }

  if (total == 0) {
    print('Nenhum recém-nascido foi digitado.');
    return;
  }

  print('\n----- Resultados -----');
  if (nomeMaiorF == '') {
    print('b) Nenhuma menina foi cadastrada');
  } else {
    print('b) Menina com maior peso: $nomeMaiorF ($maiorPesoF kg)');
  }

  print('c) Baixo Peso: ${(baixo * 100 / total).toStringAsFixed(1)}%');
  print('   Normal: ${(normal * 100 / total).toStringAsFixed(1)}%');
  print('   Alto Peso: ${(alto * 100 / total).toStringAsFixed(1)}%');
}
