void main() {
  
  List<int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];

  print("For: ${somaFor(numeros)}");
  print("while: ${somaWhile(numeros)}");
  print("recursão: ${somaRecursivo(numeros, 0)}");

  int resultado = numeros.reduce((valorAtual, elemento) => valorAtual + elemento);
  print("lista: $resultado");
}

//CLASSES PARA FAZER A SOMATORIA DOS NUMEROS

///USANDO O FOR
int somaFor(List<int> numeros) {
  int total = 0;
  for (int i = 0; i < numeros.length; i++) {
    total += numeros[i];
  }
  return total;
}

///USANDO O WHILE
int somaWhile(List<int> numeros) {
  int i = 0;
  int total = 0;
  while(i < numeros.length) {
    total += numeros[i];
    i++;
  }
  return total;
}

///USANDO RECURSIVA
int somaRecursivo(List<int> numeros, int indice) {
  if (indice == numeros.length) {
    return 0;
  } else {
    return numeros[indice] + somaRecursivo(numeros, indice + 1);
  }
}