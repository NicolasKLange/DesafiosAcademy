void main() {
  // Instanciando os itens domésticos
  ItemDomestico item1 = ItemDomestico("Detergente", 7.99, 50);
  ItemDomestico item2 = ItemDomestico("Sabão em Pó", 5.49, 30);
  ItemDomestico item3 = ItemDomestico("Desinfetante", 10.99, 60);
  ItemDomestico item4 = ItemDomestico("Esponja de Cozinha", 1.99, 10);
  ItemDomestico item5 = ItemDomestico("Papel Toalha", 12.99, 20);
  ItemDomestico item6 = ItemDomestico("Água Sanitária", 4.99, 5);
  ItemDomestico item7 = ItemDomestico("Amaciante de Roupa", 24.99, 30);
  ItemDomestico item8 = ItemDomestico("Sabonete", 2.49, 40);
  ItemDomestico item9 = ItemDomestico("Papel Higiênico", 19.99, 50);
  ItemDomestico item10 = ItemDomestico("Desengordurante", 3.99, 15);

  // Listas para controle de itens desejados e comprados
  List<ItemDomestico> itensDesejados = [];
  List<ItemDomestico> itensComprados = [];

  ControleDeItens controleDeItens = new ControleDeItens();
  print("\n***** Lista Desejados *****");
  // Adicionando itens à lista de desejos
  controleDeItens.incluirItensDesejados(itensDesejados, item1, 3);
  controleDeItens.incluirItensDesejados(itensDesejados, item5, 3);
  controleDeItens.incluirItensDesejados(itensDesejados, item7, 3);
  print("\n\n***** Itens Comprados *****");
  // Comprando alguns itens
  controleDeItens.comprarItens(itensComprados, item3, 7);
  controleDeItens.comprarItens(itensComprados, item4, 10);
  controleDeItens.comprarItens(itensComprados, item8, 5);
}

// Classe para representar itens domésticos
class ItemDomestico {
  String nome;
  double preco;
  int quantidade;

  ItemDomestico(this.nome, this.preco, this.quantidade);
}

// Classe para controle de itens domésticos
class ControleDeItens {
  /// Inclui itens na lista de desejos
  void incluirItensDesejados(List<ItemDomestico> itensDesejados, ItemDomestico item, int quantidade) {
    if (item.quantidade > quantidade) {
      itensDesejados.add(ItemDomestico(item.nome, item.preco, quantidade));
      print("____________________________________________");
      print("${item.nome} incluído na lista de desejos!");
      for (var item in itensDesejados) {
        print("Item: ${item.nome}, Preço: ${item.preco}, Quantidade: ${quantidade}");
      }
    } else {
      print("Quantidade indisponível!");
      print("Temos somente ${item.quantidade} itens no estoque");
    }
  }

  /// Inclui itens na lista de comprados
  void comprarItens(List<ItemDomestico> itensComprados, ItemDomestico item, int quantidadeComprada) {
    if (item.quantidade >= quantidadeComprada) {
      print("Compra realizada com sucesso!!");
      item.quantidade -= quantidadeComprada;
      itensComprados.add(ItemDomestico(item.nome, item.preco, item.quantidade));
      for (var item in itensComprados) {
        print("Item: ${item.nome}, Preço: ${item.preco}");
        print("____________________________________________");
      }
    } else {
      print("Quantidade indisponível!");
      print("Temos somente ${item.quantidade} itens no estoque");
    }
  }

  ControleDeItens();
}
