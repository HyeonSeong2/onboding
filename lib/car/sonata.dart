
//소나타
import 'package:first/car/car.dart';

class Sonata extends Car {
  Sonata(double price, String carName, String owner) : super(price, carName, owner);

  void oiling() {
    print('$owner이 $carName에 주유하고 있습니다.');
  }
}
