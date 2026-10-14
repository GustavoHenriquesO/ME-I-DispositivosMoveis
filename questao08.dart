// Questão 8 - vestibular da Unit (flag: código 0000)
import 'dart:io';

void main() {
  List<String> aprovadosCC = [];

  int totalM = 0;
  int totalF = 0;

  int menorPontM = 5001;
  String nomeMenorM = '';

  int maiorPontSI = -1;
  String codMaiorSI = '';

  while (true) {
    stdout.write('Código (0000 para encerrar): ');
    String codigo = stdin.readLineSync()!.trim();
    if (codigo == '0000') break;

    stdout.write('Curso (CC ou SI): ');
    String curso = stdin.readLineSync()!.trim().toUpperCase();
    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    stdout.write('Pontuação (0-5000): ');
    int pontos = int.parse(stdin.readLineSync()!);

    if (sexo == 'M') {
      totalM++;
      if (pontos < menorPontM) {
        menorPontM = pontos;
        nomeMenorM = nome;
      }
      if (curso == 'SI' && pontos > maiorPontSI) {
        maiorPontSI = pontos;
        codMaiorSI = codigo;
      }
    } else if (sexo == 'F') {
      totalF++;
    }

    if (curso == 'CC' && pontos > 2500) {
      aprovadosCC.add('Código: $codigo | Nome: $nome | Pontos: $pontos');
    }

    print('');
  }

  int total = totalM + totalF;
  if (total == 0) {
    print('Nenhum candidato foi digitado.');
    return;
  }

  print('\n----- Resultados -----');

  print('a) Candidatos de Ciência da Computação com mais de 2500 pontos:');
  if (aprovadosCC.isEmpty) {
    print('   Nenhum candidato');
  } else {
    for (var linha in aprovadosCC) {
      print('   $linha');
    }
  }

  if (totalM == 0) {
    print('b) Não há candidatos do sexo masculino');
  } else {
    print('b) Homem com a menor pontuação: $nomeMenorM ($menorPontM pontos)');
  }

  if (codMaiorSI == '') {
    print('c) Não há homens em Sistemas de Informação');
  } else {
    print('c) Homem com a maior pontuação em SI: código $codMaiorSI ($maiorPontSI pontos)');
  }

  print('d) Masculino: ${(totalM * 100 / total).toStringAsFixed(1)}%');
  print('   Feminino: ${(totalF * 100 / total).toStringAsFixed(1)}%');
}
