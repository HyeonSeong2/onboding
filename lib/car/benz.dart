import 'package:first/car/car.dart';
import 'package:first/car/car_interface.dart';

// CarInterface 추가 시 Missing concrete implementation of 'CarInterface.sell' 에러 발생
// 원인 : interface 구현부가 없어서 생기는 문제
// -> sell(){} 추가
class Benz extends Car implements CarInterface {
  Benz(double price, String carName, String owner)
      : super(price, carName, owner);

  void repair() {
    print('$owner이 $carName를 수리했습니다.');
  }

  @override
  void sell() {}

  @override
  void check() {}
}
