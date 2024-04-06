void main() {
  final String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

  imprimirInformacoes(paragrafo);
}

// ****** CRIACAO DE CLASSES ******


/// Imprimir as informacoes
void imprimirInformacoes(String paragrafo){
  print("Parágrafo: $paragrafo");
  print("Numero de palavras: ${contadorDePalavras(paragrafo)}");
  print("Tamanho do texto: ${paragrafo.length}");
  print("Numero de frases: ${contadorDeFrases(paragrafo)}");
  print("Numero total de vogais: ${contadorDeVogais(paragrafo)}");
  print("Consoantes presentes no texto: ${procuraConsoantes(paragrafo)}");
}


/// Contador de palavras
int contadorDePalavras(String paragrafo){
  int contadorDePalavras = 0;
  String espaco = ' ';

  for(int i = 0; i < paragrafo.length; i++) {
    if(espaco.contains(paragrafo[i])) {
      contadorDePalavras++;
    }
  }
  return contadorDePalavras;
}


/// Contador das vogais
int contadorDeVogais(String paragrafo) {
  int contadorDeVogal = 0;
  List<String> vogais = ['a', 'e', 'i', 'o', 'u'];

  for(int i = 0; i < paragrafo.length; i++) {
    if(vogais.contains(paragrafo[i])) {
      contadorDeVogal++;
    }
  }
  return contadorDeVogal;
}


/// Contador das frases que constituem o texto
int contadorDeFrases(String paragrafo) {
  int contadorDeFrases = 0;
  List<String> pontuacao = ['.', '!', '?'];

  for(int i = 0; i < paragrafo.length; i++) {
    if(pontuacao.contains(paragrafo[i])) {
      contadorDeFrases++;
    }
  }
  return contadorDeFrases;
}


/// Procura as consoantes que estao presentes no texto
Set<String> procuraConsoantes(String paragrafo) {
  List<String> vogais = ['a', 'e', 'i', 'o', 'u'];
  Set<String> consoantes = Set();
  paragrafo = paragrafo.toLowerCase();

  for(int i = 0; i < paragrafo.length; i++) {
    if (paragrafo[i].toLowerCase() != paragrafo[i].toUpperCase()) {
      if(!vogais.contains(paragrafo[i])) {
        consoantes.add(paragrafo[i]);
      }
    }
  }
  List<String> listaConsoantes = consoantes.toList(); // Convertendo o Set para Lista
  listaConsoantes.sort();  // Ordenando a lista de consoantes em ordem alfabética
  return listaConsoantes.toSet(); // Convertendo a Lista ordenada de volta para Set
}