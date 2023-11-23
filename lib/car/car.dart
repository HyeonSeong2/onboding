// this : 클래스 내부의 멤버에 접근
// super : 부모 클래스의 멤버에 접근
// dart 클래스는 모두 암묵적 인터페이스 이기 때문에 키워드가 따로 존재하지 않는다. -> implement를 사용

// 부모 클래스
import 'package:first/car/sonata.dart';

import 'benz.dart';
import 'genesis.dart';

// abstract는 인스턴스 생성이 불가.
// typedef 타입 정의
abstract class Car {
  double price;
  String carName;
  String owner;

  Car(this.price, this.carName, this.owner);

  void drive() {
    print('$carName가 달리고 있습니다.');
  }

  void stop() {
    print('$carName가 정지했습니다.');
  }
}

void fff() {
  // 벤츠
  Benz benz = Benz(3000, 'Benz', '홍길동');
  benz.drive();
  benz.stop();
  benz.repair();

  // 제네시스
  Genesis genesis = Genesis(2000, 'Genesis', '길홍동');
  genesis.drive();
  genesis.stop();
  genesis.carWash();

  // 소나타
  Sonata sonata = Sonata(1000, 'Sonata', '동길홍');
  sonata.drive();
  sonata.stop();
  sonata.oiling();

  //
  // Sale benzSale = Sale(benz);
  // benzSale.sell();
  //
  // Sale genesisSale = Sale(genesis);
  // genesisSale.sell();
}
