import 'dart:math' as math;

/// Classe base para representar formas geométricas.
abstract class FormaGeometrica {
  final String nome;

  /// Construtor que recebe o [nome] da forma geométrica.
  FormaGeometrica(this.nome);

  /// Retorna a área da forma geométrica.
  double area();

  /// Retorna o perímetro da forma geométrica.
  double perimetro();
}

/// Representa a forma geométrica "círculo".
class Circulo extends FormaGeometrica {
  final double raio;

  /// Construtor que recebe o [nome] e o [raio] do círculo.
  Circulo(String nome, this.raio) : super(nome);

  @override
  double area() => math.pi * math.pow(raio, 2);

  @override
  double perimetro() => 2 * math.pi * raio;
}

/// Representa a forma geométrica "retângulo".
class Retangulo extends FormaGeometrica {
  final double altura;
  final double largura;

  /// Construtor que recebe o [nome], [altura] e [largura] do retângulo.
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  @override
  double area() => altura * largura;

  @override
  double perimetro() => (altura * 2) + (largura * 2);
}

/// Representa a forma geométrica "quadrado".
class Quadrado extends Retangulo {
  /// Construtor que recebe o [nome] e o [lado] do quadrado.
  Quadrado(String nome, double lado) : super(nome, lado, lado);
}

/// Representa a forma geométrica "triângulo equilátero".
class TrianguloEquilatero extends FormaGeometrica {
  final double lado;

  /// Construtor que recebe o [nome] e o [lado] do triângulo equilátero.
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double area() => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double perimetro() => 3 * lado;
}

/// Representa a forma geométrica "triângulo retângulo".
class TrianguloRetangulo extends FormaGeometrica {
  final double base;
  final double altura;

  /// Construtor que recebe o [nome], [base] e [altura] do triângulo retângulo.
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  @override
  double area() => (base * altura) / 2;

  @override
  double perimetro() => base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

/// Representa a forma geométrica "pentágono regular".
class PentagonoRegular extends FormaGeometrica {
  final double lado;

  /// Construtor que recebe o [nome] e o [lado] do pentágono regular.
  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double area() {
    final apotema = lado / (2 * math.tan(math.pi / 5));
    return (5 * lado * apotema) / 2;
  }

  @override
  double perimetro() => 5 * lado;
}

/// Representa a forma geométrica "hexágono regular".
class HexagonoRegular extends FormaGeometrica {
  final double lado;

  /// Construtor que recebe o [nome] e o [lado] do hexágono regular.
  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double area() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double perimetro() => 6 * lado;
}

/// Compara características de formas geométricas.
class ComparadorFormasGeometricas {
  /// Retorna a forma geométrica com a maior área, ou [formaA] caso as áreas sejam iguais.
  FormaGeometrica formaDeMaiorArea(FormaGeometrica formaA, FormaGeometrica formaB) {
    if (formaA.area() > formaB.area()) {
      return formaA;
    } else if (formaB.area() > formaA.area()) {
      return formaB;
    }
    return formaA;
  }

  /// Retorna a forma geométrica com o maior perímetro, ou [formaA] caso os perímetros sejam iguais.
  FormaGeometrica formaDeMaiorPerimetro(FormaGeometrica formaA, FormaGeometrica formaB) {
    if (formaA.perimetro() > formaB.perimetro()) {
      return formaA;
    } else if (formaB.perimetro() > formaA.perimetro()) {
      return formaB;
    }
    return formaA;
  }
}
