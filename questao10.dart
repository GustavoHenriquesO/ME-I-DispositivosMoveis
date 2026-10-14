// Questão 10 - perfil dos candidatos às vagas (flag: nome FIM)
import 'dart:io';

void main() {
  int totalF = 0;
  int totalM = 0;

  int homensComExp = 0;
  int somaIdadeHomensExp = 0;

  int homensMais45 = 0;

  int mulheresMenos30Exp = 0;

  int menorIdadeF = 1000;
  String nomeMenorF = '';

  while (true) {
    stdout.write('Nome (FIM para encerrar): ');
    String nome = stdin.readLineSync()!.trim();
    if (nome.toUpperCase() == 'FIM') break;

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    stdout.write('Idade: ');
    int idade = int.parse(stdin.readLineSync()!);
    stdout.write('Tem experiência? (S/N): ');
    bool experiencia = stdin.readLineSync()!.trim().toUpperCase() == 'S';

    if (sexo == 'M') {
      totalM++;
      if (experiencia) {
        homensComExp++;
        somaIdadeHomensExp += idade;
      }
      if (idade > 45) {
        homensMais45++;
      }
    } else if (sexo == 'F') {
      totalF++;
      if (experiencia) {
        if (idade < 30) {
          mulheresMenos30Exp++;
        }
        if (idade < menorIdadeF) {
          menorIdadeF = idade;
          nomeMenorF = nome;
        }
      }
    }

    print('');
  }

  print('\n----- Resultados -----');
  print('a) Mulheres: $totalF | Homens: $totalM');

  if (homensComExp == 0) {
    print('b) Nenhum homem com experiência');
  } else {
    print('b) Idade média dos homens com experiência: ${(somaIdadeHomensExp / homensComExp).toStringAsFixed(1)} anos');
  }

  if (totalM == 0) {
    print('c) Não há homens cadastrados');
  } else {
    print('c) Homens com mais de 45 anos: ${(homensMais45 * 100 / totalM).toStringAsFixed(1)}%');
  }

  print('d) Mulheres com menos de 30 anos e experiência: $mulheresMenos30Exp');

  if (nomeMenorF == '') {
    print('e) Nenhuma candidata com experiência');
  } else {
    print('e) Candidata mais nova com experiência: $nomeMenorF ($menorIdadeF anos)');
  }
}
