// Questão 11 - salário dos professores (flag: código 9999)
// valor da hora-aula: R$ 12,30 | desconto: homens 10%, mulheres 5%
import 'dart:io';

void main() {
  const double valorHora = 12.30;

  double somaLiquidoM = 0;
  int qtdM = 0;
  double somaLiquidoF = 0;
  int qtdF = 0;

  print('--- Cadastro de professores ---');

  while (true) {
    stdout.write('Código (9999 para encerrar): ');
    String codigo = stdin.readLineSync()!.trim();
    if (codigo == '9999') break;

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();
    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();
    stdout.write('Horas de aula no mês: ');
    double horas = double.parse(stdin.readLineSync()!.replaceAll(',', '.'));

    double bruto = horas * valorHora;
    double desconto = 0;

    if (sexo == 'M') {
      desconto = 0.10;
    } else if (sexo == 'F') {
      desconto = 0.05;
    }

    double liquido = bruto - bruto * desconto;

    if (sexo == 'M') {
      somaLiquidoM += liquido;
      qtdM++;
    } else if (sexo == 'F') {
      somaLiquidoF += liquido;
      qtdF++;
    }

    print('Código: $codigo | Nome: $nome | Bruto: R\$ ${bruto.toStringAsFixed(2)} | Líquido: R\$ ${liquido.toStringAsFixed(2)}\n');
  }

  print('\n----- Médias dos salários líquidos -----');

  if (qtdM == 0) {
    print('Homens: nenhum professor cadastrado');
  } else {
    print('Homens: R\$ ${(somaLiquidoM / qtdM).toStringAsFixed(2)}');
  }

  if (qtdF == 0) {
    print('Mulheres: nenhuma professora cadastrada');
  } else {
    print('Mulheres: R\$ ${(somaLiquidoF / qtdF).toStringAsFixed(2)}');
  }
}
