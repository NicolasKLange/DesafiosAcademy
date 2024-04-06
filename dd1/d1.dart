import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for(int i = 0; i < raios.length; i++){
    print("Raio: ${raios[i]}, "
          "area: ${(pi * raios[i] * raios[i]).toStringAsFixed(2)}, "
          "perimetro: ${(2 * pi * raios[i]).toStringAsFixed(2)}");

  }
}