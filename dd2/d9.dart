void main() {
  final controleDePessoas = ControleDePessoas();

  // Cadastrando pessoas no sistema
  controleDePessoas
    ..cadastrarPessoa(Pessoa('Jose', Mes.Abril))
    ..cadastrarPessoa(Pessoa('Arthur', Mes.Agosto))
    ..cadastrarPessoa(Pessoa('Joao', Mes.Abril))
    ..cadastrarPessoa(Pessoa('Jesse', Mes.Dezembro))
    ..cadastrarPessoa(Pessoa('Roberta', Mes.Fevereiro))
    ..cadastrarPessoa(Pessoa('Carla', Mes.Fevereiro))
    ..cadastrarPessoa(Pessoa('Thania', Mes.Agosto))
    ..cadastrarPessoa(Pessoa('Rafaela', Mes.Marco))
    ..cadastrarPessoa(Pessoa('Yuri', Mes.Junho))
    ..cadastrarPessoa(Pessoa('Jonas', Mes.Setembro))
    ..cadastrarPessoa(Pessoa('Elias', Mes.Outubro))
    ..cadastrarPessoa(Pessoa('Abel', Mes.Maio))
    ..cadastrarPessoa(Pessoa('Danilo', Mes.Abril))
    ..cadastrarPessoa(Pessoa('Jonathan', Mes.Abril))
    ..cadastrarPessoa(Pessoa('Joseph', Mes.Setembro))
    ..cadastrarPessoa(Pessoa('Abdul', Mes.Janeiro))
    ..cadastrarPessoa(Pessoa('Jean', Mes.Abril));

  // Passar por todos os meses com pessoas, e imprimir os nomes das pessoas
  for (final entry in controleDePessoas.pessoasPorMes.entries) {
    print('\n${entry.key.name}');
    for (final pessoa in entry.value) {
      print(' > ${pessoa.nome}');
    }
  }
}

enum Mes {
  Janeiro,
  Fevereiro,
  Marco,
  Abril,
  Maio,
  Junho,
  Julho,
  Agosto,
  Setembro,
  Outubro,
  Novembro,
  Dezembro,
}

class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

class ControleDePessoas {
  final _pessoasPorMes = <Mes, List<Pessoa>>{};

  /// Cadastra uma pessoa no sistema
  void cadastrarPessoa(Pessoa pessoa) {
    final mes = pessoa.mesDeNascimento;
    _pessoasPorMes[mes] ??= [];
    _pessoasPorMes[mes]!.add(pessoa);
  }

  /// Retorna o mapa de meses com pessoas cadastradas
  Map<Mes, List<Pessoa>> get pessoasPorMes => _pessoasPorMes;
}