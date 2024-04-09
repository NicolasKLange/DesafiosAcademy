// NAO PODE SER MODIFICADO
// -------------------------------------------------------------
import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  //PEGANDO UM MEIO DE COMUNICACAO ALEATORIAMENTE
  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

///****CRIACAO DAS CLASSES****

//CLASSE DOS MEIOS DE COMUNICACAO
abstract class MeioDeComunicacao {
  void fazerLigacao(String numero) {
  }
}

//CLASSE DO TELEFONE
class Telefone extends MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[TELEFONE] Ligando para $numero");
  }
}

//CLASSE DO CELULAR
class Celular extends MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[CELULAR] Ligando para $numero");
  }
}

//CLASSE DO ORELHAO
class Orelhao extends MeioDeComunicacao {
  void fazerLigacao(String numero) {
    print("[ORELHÃO] Ligando para $numero");
  }
}