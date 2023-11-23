

//제네시스
import 'package:first/car/car.dart';

class Genesis extends Car {
  // 생성자
  Genesis(double price, String carName, String owner) : super(price, carName, owner);

  void carWash() {
    print('$owner이 $carName를 세차하고 있습니다.');
  }
}
