import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);
  final trianguloEquilateroA = TrianguloEquilatero('Triângulo Equilátero A', 5);
  final trianguloEquilateroB = TrianguloEquilatero('Triângulo Equilátero B', 8);
  final trianguloRetanguloA = TrianguloRetangulo('Triângulo Retângulo A', 4, 3);
  final trianguloRetanguloB = TrianguloRetangulo('Triângulo Retângulo B', 5, 12);
  final pentagonoRegularA = PentagonoRegular('Pentágono Regular A', 5);
  final pentagonoRegularB = PentagonoRegular('Pentágono Regular B', 8);
  final hexagonoRegularA = HexagonoRegular('Hexágono Regular A', 5);
  final hexagonoRegularB = HexagonoRegular('Hexágono Regular B', 8);

  final formas = [
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,   
    hexagonoRegularB,
  ];

  FormaGeometrica maiorArea = comparador.maior(formas, (a, b) => a.area.compareTo(b.area));
  FormaGeometrica maiorPerimetro =
  comparador.maior(formas, (a, b) => a.perimetro.compareTo(b.perimetro));

  print('A maior área é ${maiorArea.nome} com ${maiorArea.area.toStringAsFixed(2)}');
  print('O maior perímetro é ${maiorPerimetro.nome} com ${maiorPerimetro.perimetro.toStringAsFixed(2)}');
}

abstract class FormaGeometrica {
  final String nome;

  FormaGeometrica(this.nome);

  double get area;
  double get perimetro;
}

class Circulo extends FormaGeometrica {
  final double raio;

  Circulo(String nome, this.raio) : super(nome);

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  final double largura;
  final double altura;

  Retangulo(String nome, this.largura, this.altura) : super(nome);

  @override
  double get area => largura * altura;

  @override
  double get perimetro => (largura * 2) + (altura * 2);
}

class TrianguloEquilatero extends FormaGeometrica {
  final double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double get area => (lado * lado * math.sqrt(3)) / 4;

  @override
  double get perimetro => lado * 3;
}

class TrianguloRetangulo extends FormaGeometrica {
  final double base;
  final double altura;

  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro => base + altura + math.sqrt((base * base) + (altura * altura));
}

class PentagonoRegular extends FormaGeometrica {
  final double lado;

  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area {
    final apotema = lado / (2 * math.tan(math.pi / 5));
    return (5 * lado * apotema) / 2;
  }

  @override
  double get perimetro => lado * 5;
}

class HexagonoRegular extends FormaGeometrica {
  final double lado;

  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area {
    final apotema = lado * math.sqrt(3) / 2;
    return (3 * math.sqrt(3) * lado * lado) / 2;
  }

  @override
  double get perimetro => lado * 6;
}

class ComparadorFormasGeometricas {
  T maior<T extends FormaGeometrica>(List<T> formas, int Function(T a, T b) comparador) {
    if (formas.isEmpty) {
      throw ArgumentError('A lista de formas não pode ser vazia.');
    }
    T formaMaior = formas[0];
    for (int i = 1; i < formas.length; i++) {
      if (comparador(formas[i], formaMaior) > 0) {
        formaMaior = formas[i];
      }
    }
    return formaMaior;
  }
}
