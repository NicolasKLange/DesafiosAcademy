import 'dart:math';

void main(){
   Random random = Random();

   //Lista com todos os nomes
   List<String> nomes =
    ["Ana", "Francisco","Joao", "Pedro", "Gabriel", "Rafaela",
     "Marcio", "Jose", "Carlos", "Patricia", "Helena", "Camila",
     "Mateus", "Gabriel", "Maria", "Samuel", "Karina","Antonio",
     "Daniel", "Joel", "Cristiana", "Sebastião", "Paula"];

   //Lista com todos os sobrenomes
   List<String> sobrenomes =
    ["Silva", "Ferreira", "Almeida", "Azevedo", "Braga", "Barros",
     "Campos", "Cardoso", "Teixeira", "Costa", "Santos", "Rodrigues",
     "Souza", "Alves", "Pereira", "Lima", "Gomes", "Ribeiro",
     "Carvalho", "Lopes", "Barbosa"];

   //Pegar o numero de um nome e um sobrenome aleatorio
   int numeroDoNomeAleatorio = random.nextInt(nomes.length);
   int numeroDoSobrenomeAleatorio = random.nextInt(sobrenomes.length);
   
   //Pegando o numero e verificar qual é o nome e sobrenome
   String nomeAleatorio = nomes[numeroDoNomeAleatorio];
   String sobrenomeAleatorio = sobrenomes[numeroDoSobrenomeAleatorio];

   //Imprimindo o nome e sobrenome aleatorio
   print("Nome: $nomeAleatorio $sobrenomeAleatorio");
}