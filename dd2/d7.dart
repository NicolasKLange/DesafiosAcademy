import 'dart:collection';
import 'dart:math';

void main() {
  // Criando a fila do mercado
  FilaDoMercado filaDoMercado = FilaDoMercado();

  // Populando a fila com 10 pessoas
  for (int i = 0; i < 10; i++) {
    filaDoMercado.entrarNaFila(geradorDeNomes.gerarNomeAleatorio());
  }

  // Atendendo as pessoas conforme a ordem de entrada na fila
  while (!filaDoMercado.filaVazia()) {
    String pessoa = filaDoMercado.atenderPessoa();
    print("($pessoa) foi atendido(a)");
  }
}

// Classe para controlar a fila do mercado
class FilaDoMercado {
  Queue<String> fila = Queue<String>(); // Fila de pessoas

  // Método para adicionar uma pessoa à fila
  void entrarNaFila(String pessoa) {
    fila.addLast(pessoa);
    print("($pessoa) entrou na fila");
  }

  // Método para atender a próxima pessoa na fila
  String atenderPessoa() {
    return fila.removeFirst();
  }

  // Método para verificar se a fila está vazia
  bool filaVazia() {
    return fila.isEmpty;
  }
}

// Classe para gerar nomes aleatórios
class geradorDeNomes {
  static String gerarNomeAleatorio() {
    List<String> nomes = ["Ana", "João", "Maria", "Pedro", "Carla", "Lucas", "Julia", "Marcos"];
    List<String> sobrenomes = ["Silva", "Santos", "Oliveira", "Souza", "Costa", "Pereira", "Rodrigues"];

    Random random = Random();
    String nomeAleatorio = nomes[random.nextInt(nomes.length)];
    String sobrenomeAleatorio = sobrenomes[random.nextInt(sobrenomes.length)];

    return "$nomeAleatorio $sobrenomeAleatorio";
  }
}
