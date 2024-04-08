import 'dart:math';

void main() {
  Random random = Random();
  var indiceRandom = random.nextInt(5);

  /// LISTA PARA CHAMAR TODOS OS FORNECEDORES
  List<Fornecedores> fornecedores = [FornecedorDeBebidas(), FornecedorDeBolos(), FornecedorDePetiscos(), FornecedorDeSaladas(), FornecedorDeSanduiches()];
  final pessoa = Pessoa();
  /// ESCOLHER UM FORNCEDOR ALEATORIO
  final fornecedorAleatorio = fornecedores[indiceRandom];

  for (var i = 0; i < 5; i++) {
    // FUNCAO PARA A PESSOA COM AS SUAS REFEICOES
    pessoa.refeicao(fornecedorAleatorio);
    // CONTADOR DAS REFEICOES
    pessoa.contadorDeRefeicoes++;
  }
  // IMPRIMI AS INFORMACOES DA CLASSE PESSOA
  pessoa.informacoes();
}

//CLASSE PARA OS PRODUTOS COM OS PARAMETROS
class Produto{
  Produto(this.nome, this.calorias);

  /// NOME PRODUTO
  final String nome;
  /// TOTAL DAS CALORIAS
  final int calorias;
}

///CLASSE DO FORNECEDOR
abstract class Fornecedores {
  Produto fornecer();
  // FUNCAO PARA FORNCER OS PRODUTOS ALEATORIOS
  Produto fornecerProdutoAleatorio();
}

///FORNECEDOR DE BEBIDAS
class FornecedorDeBebidas extends Fornecedores{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  // Retorna um produto que pode ser consumido por um consumidor
  @override
  Produto fornecerProdutoAleatorio() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }

}

///FORNECEDOR DE SANDUICHES
class FornecedorDeSanduiches extends Fornecedores{
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('sanduiche de frango', 240),
    Produto('sanduiche de calabresa', 480),
    Produto('sanduiche de oregano', 240),
    Produto('sanduiche de queijo', 300),
    Produto('sanduiche de margarina', 520),
    Produto('sanduiche de carne', 400)
  ];

  @override
  Produto fornecerProdutoAleatorio() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
}

///FORNECEDOR DE BOLOS
class FornecedorDeBolos extends Fornecedores{
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de queijo', 330),
    Produto('Bolo de goiabada', 400),
    Produto('Bolo de frutas vermelhas', 420),
    Produto('Bolo de brigadeiro', 540),
    Produto('Bolo crocante', 390),
    Produto('Bolo de laranja', 320)
  ];

  @override
  Produto fornecerProdutoAleatorio() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
}

///FORNECEDOR DE SALADAS
class FornecedorDeSaladas extends Fornecedores{
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Salada de alface', 150),
    Produto('Salada de batata', 200),
    Produto('Salada de tomate', 100),
    Produto('Salada caesar', 250),
    Produto('Salada de espinafre', 180),
    Produto('Salada waldorf', 220)
  ];

  @override
  Produto fornecerProdutoAleatorio() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
}

///FORNECEDOR DE PETISCOS
class FornecedorDePetiscos extends Fornecedores{
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Batata Frira', 300),
    Produto('Polenta frita', 400),
    Produto('Amendoim doce', 350),
    Produto('Salames', 380),
    Produto('Batata frita', 500),
    Produto('Queijo brie', 430)
  ];

  @override
  Produto fornecerProdutoAleatorio() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
}

///FORNECEDORES DE ULTRA CALORICOS
class FornecedorDeUltraCaloricos extends Fornecedores{
  final _random = Random();
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('Pizza', 940),
    Produto('Hamburguer', 800),
    Produto('Abacate', 690),
    Produto('Azeite', 860),
    Produto('Pasta de amendoim', 750),
    Produto('Aveia', 630)
  ];

  @override
  Produto fornecerProdutoAleatorio() {
    return _ultraCaloricosDisponiveis[_random.nextInt(_ultraCaloricosDisponiveis.length)];
  }
  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
}

///CLASSE DA PESSOA COM AS SUAS COLORIAS
class Pessoa {
  Random random = Random();
  // Acumulador de calorias
  int _caloriasConsumidas = 0;
  late int _caloriasIniciais;
  int contadorDeRefeicoes = 0;

  Pessoa() {
    _caloriasIniciais = random.nextInt(2500);
  }



  /// IMPRIMINDO INFORMACACOES DO FORNECEDOR
  void informacoes() {
    print("Caloria incial: ${_caloriasIniciais}");
    print('Calorias consumidas: $_caloriasConsumidas');
    statusDeCalorias(_caloriasConsumidas);
    bool precisaComer = _caloriasIniciais < 1800;
    print("Precisa comer? $precisaComer");
    print("Número de refeições: $contadorDeRefeicoes");
  }

  /// IMPRIMI TODOS OS ALIMENTOS DO CONSUMIDOR E A QUANTIDADE DE CALORIAS DE CADA UM
  void refeicao(Fornecedores fornecer) {
    final produto = fornecer.fornecerProdutoAleatorio();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    (_caloriasConsumidas += produto.calorias);
  }

  ///VERIFICA O STATUS DA PESSOA COM AS CALORIAS DIARIA
  void statusDeCalorias(int _caloriasConsumidas) {
    if(_caloriasConsumidas <= 500) {
      print("Deficit extremo de calorias.");
    } else if(_caloriasConsumidas <= 1800) {
      print("Deficit de calorias.");
    } else if(_caloriasConsumidas <= 2500) {
      print("Satisfeito");
    } else {
      print("Excesso de calorias.");
    }
  }
}