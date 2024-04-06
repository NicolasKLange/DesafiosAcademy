void main() {
  List<double> graus = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];

  for(int i = 0; i < graus.length; i++) {
    print("Celcius: ${graus[i]}, "
          "fahrenheit: ${((graus[i] * 9/5) + 32).toStringAsFixed(2)}, "
          "kelvin: ${(graus[i] + 273.15).toStringAsFixed(2)}");
  }
}