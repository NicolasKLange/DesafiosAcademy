/// Função principal que executa o programa.
void main() {
  var biblioteca = BibliotecaDeMusicas();

  // Adicionar algumas músicas de exemplo
  biblioteca.adicionarMusica(Musica('Evidências', 'Chitãozinho & Xororó', 'Cowboy do Asfalto', 296));
  biblioteca.adicionarMusica(Musica('Tente Outra Vez', 'Raul Seixas', 'Gita', 235));
  biblioteca.adicionarMusica(Musica('Fio de Cabelo', 'Chitãozinho & Xororó', 'Chitãozinho & Xororó', 320));

  // Imprimir informações da biblioteca
  biblioteca.imprimirMusicas();
  print('Número de músicas: ${biblioteca.numeroDeMusicas()}');
  print('Tempo total em horas: ${biblioteca.tempoTotalEmHoras()}');

  // Buscar música pelo título
  var musicasPorTitulo = biblioteca.buscarPorTitulo('Evidências');
  print('\n--- Buscar por Título: "Evidências" ---');
  musicasPorTitulo.forEach((musica) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  });

  // Buscar música pelo artista
  var musicasPorArtista = biblioteca.buscarPorArtista('Chitãozinho & Xororó');
  print('\n--- Buscar por Artista: "Chitãozinho & Xororóe" ---');
  musicasPorArtista.forEach((musica) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  });

  // Buscar música pelo álbum
  var musicasPorAlbum = biblioteca.buscarPorAlbum('Gita');
  print('\n--- Buscar por Álbum: "Gita" ---');
  musicasPorAlbum.forEach((musica) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  });
}


/// Classe para representar uma música individual.
class Musica {
  String titulo;
  String artista;
  String album;
  int duracao; // Duracao em segundos

  /// Construtor da classe Musica.
  Musica(this.titulo, this.artista, this.album, this.duracao);
}

/// Classe para representar uma biblioteca de músicas.
class BibliotecaDeMusicas {
  List<Musica> musicas = []; // Lista de músicas na biblioteca

  /// Adiciona uma nova música à biblioteca.
  void adicionarMusica(Musica musica) {
    musicas.add(musica);
  }

  /// Imprime as informações de todas as músicas na biblioteca.
  void imprimirMusicas() {
    print('--- Biblioteca de Músicas ---');
    musicas.forEach((musica) {
      print('Título: ${musica.titulo}');
      print('Artista: ${musica.artista}');
      print('Álbum: ${musica.album}');
      print('Duração: ${_formatarDuracao(musica.duracao)}');
      print('----------------------------');
    });
  }

  /// Retorna o número total de músicas na biblioteca.
  int numeroDeMusicas() {
    return musicas.length;
  }

  /// Calcula o tempo total em horas de todas as músicas na biblioteca.
  double tempoTotalEmHoras() {
    int duracaoTotal = musicas.fold(0, (total, musica) => total + musica.duracao);
    return duracaoTotal / 3600; // Convertendo segundos para horas
  }

  /// Busca músicas pelo título.
  List<Musica> buscarPorTitulo(String titulo) {
    return musicas.where((musica) => musica.titulo.toLowerCase() == titulo.toLowerCase()).toList();
  }

  /// Busca músicas pelo artista.
  List<Musica> buscarPorArtista(String artista) {
    return musicas.where((musica) => musica.artista.toLowerCase() == artista.toLowerCase()).toList();
  }

  /// Busca músicas pelo álbum.
  List<Musica> buscarPorAlbum(String album) {
    return musicas.where((musica) => musica.album.toLowerCase() == album.toLowerCase()).toList();
  }

  /// Formata a duração da música de segundos para horas:minutos:segundos.
  String _formatarDuracao(int duracao) {
    int horas = duracao ~/ 3600;
    int minutos = (duracao % 3600) ~/ 60;
    int segundos = duracao % 60;
    return '$horas:$minutos:$segundos';
  }
}