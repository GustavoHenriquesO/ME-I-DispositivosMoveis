// Questão 4 - alunos da escola (flag: matrícula 00000)
import 'dart:io';

double lerNota(String msg) {
  stdout.write(msg);
  return double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
}

void main() {
  int totalAlunos = 0;
  int aprovados = 0;
  double somaMedias = 0;

  double melhorMediaM = -1;
  String matriculaM = '';
  double melhorMediaF = -1;
  String matriculaF = '';

  int totalF = 0;
  double somaMediasF = 0;

  while (true) {
    stdout.write('Matrícula (00000 para encerrar): ');
    String matricula = stdin.readLineSync()!.trim();
    if (matricula == '00000') break;

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    double n1 = lerNota('Nota 1: ');
    double n2 = lerNota('Nota 2: ');
    double n3 = lerNota('Nota 3: ');
    stdout.write('Número de faltas: ');
    int faltas = int.parse(stdin.readLineSync()!);

    double media = (n1 + n2 + n3) / 3;
    bool aprovado = media >= 7.0 && faltas <= 18;

    totalAlunos++;
    somaMedias += media;

    if (sexo == 'F') {
      totalF++;
      somaMediasF += media;
    }

    if (aprovado) {
      aprovados++;
      if (sexo == 'M' && media > melhorMediaM) {
        melhorMediaM = media;
        matriculaM = matricula;
      }
      if (sexo == 'F' && media > melhorMediaF) {
        melhorMediaF = media;
        matriculaF = matricula;
      }
    }

    print('$nome - média ${media.toStringAsFixed(2)} - ${aprovado ? "Aprovado" : "Reprovado"}\n');
  }

  if (totalAlunos == 0) {
    print('Nenhum aluno foi digitado.');
    return;
  }

  print('\n----- Resultados -----');
  print('a) Média da turma: ${(somaMedias / totalAlunos).toStringAsFixed(2)}');
  print('b) Percentual de aprovados: ${(aprovados * 100 / totalAlunos).toStringAsFixed(1)}%');

  if (matriculaM == '') {
    print('c) Nenhum aluno do sexo masculino foi aprovado');
  } else {
    print('c) Masculino com maior média (aprovado): $matriculaM');
  }
  if (matriculaF == '') {
    print('   Nenhuma aluna do sexo feminino foi aprovada');
  } else {
    print('   Feminino com maior média (aprovada): $matriculaF');
  }

  if (totalF == 0) {
    print('d) Não há alunas na turma');
  } else {
    print('d) Média das alunas: ${(somaMediasF / totalF).toStringAsFixed(2)}');
  }
}
