import 'dart:core'; // Importa a biblioteca core do Dart para usar a classe DateTime e obter a data atual

void main() {
  DateTime dataAtual = DateTime.now(); // Obtém a data e hora atual
  DateTime dataCalculada = somarDiasUteis(dataAtual, 18); // Chama a função para somar os dias úteis

  // Imprime as datas formatadas no console
  print('Data atual: ${formatarData(dataAtual)}');
  print('Data calculada: ${formatarData(dataCalculada)}');
}

// Função para somar dias úteis a uma data inicial
DateTime somarDiasUteis(DateTime data, int dias) {
  int diasUteis = 0; // Contador de dias úteis
  while (diasUteis < dias) { // Loop até atingir o número desejado de dias úteis
    data = data.add(Duration(days: 1)); // Adiciona um dia à data
    if (data.weekday >= 1 && data.weekday <= 5) { // Verifica se é um dia útil (de segunda a sexta-feira)
      diasUteis++; // Incrementa o contador de dias úteis
    }
  }
  return data; // Retorna a data após a adição dos dias úteis
}

// Função para formatar uma data no padrão dia/mês/ano
String formatarData(DateTime data) {
  return '${_adicionarZero(data.day)}/${_adicionarZero(data.month)}/${data.year}'; // Retorna a data formatada
}

// Função auxiliar para adicionar um zero à esquerda a um número menor que 10
String _adicionarZero(int numero) {
  return numero.toString().padLeft(2, '0'); // Retorna o número formatado com zero à esquerda
}