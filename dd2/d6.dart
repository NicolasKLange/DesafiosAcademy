import 'dart:collection';

void main() {
  Queue<Carta> baralho = Queue<Carta>();

  // Incluindo as cartas no baralho na ordem especificada
  empilharCarta(baralho, Carta('A', 'paus'));
  empilharCarta(baralho, Carta('A', 'copas'));
  empilharCarta(baralho, Carta('A', 'espadas'));
  empilharCarta(baralho, Carta('A', 'ouros'));

  print("----- Baralho de Cartas -----");
  mostrarBaralho(baralho);

  print("----- Removendo Cartas do Baralho -----");
  // Removendo todas as cartas do baralho
  while (baralho.isNotEmpty) {
    removerCartaDoBaralho(baralho);
  }
}

class Carta {
  String valor;
  String naipe;

  Carta(this.valor, this.naipe) {
    // Verificando se o naipe é válido
    assert(naipe == 'paus' || naipe == 'copas' || naipe == 'espadas' || naipe == 'ouros',
    'Naipe inválido: $naipe');
  }

  @override
  String toString() {
    // Utilizando os caracteres unicode para os naipes
    Map<String, String> unicodeNaipe = {
      'paus': '\u2663',
      'copas': '\u2665',
      'espadas': '\u2660',
      'ouros': '\u2666'
    };
    return '$valor ${unicodeNaipe[naipe]}'; // Retorna a representação da carta como uma string
  }
}

void empilharCarta(Queue<Carta> baralho, Carta carta) {
  baralho.addLast(carta); // Adiciona a carta ao final do baralho (fila)
  print("A carta empilhada foi o ${carta.valor} de ${carta.naipe}");
}

void mostrarBaralho(Queue<Carta> baralho) {
  for (var carta in baralho) {
    print(carta); // Mostra cada carta presente no baralho
  }
}

void removerCartaDoBaralho(Queue<Carta> baralho) {
  Carta cartaRemovida = baralho.removeFirst(); // Remove a primeira carta do baralho
  print("Removendo carta do topo: $cartaRemovida"); // Mostra a carta removida do topo do baralho
}
