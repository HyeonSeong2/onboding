// CarInterface
abstract class CarInterface {
  // 구현부는 상속받은 클래스에서 선언 해주어야함.
  void sell();

  // 자식 클래스에서 구현을 하면 부모 클래스의 구현부는 무시된다.
  void check() {
    print('check');
  }
}

//mixin으로 구현 했을 시 부모 클래스가 구현되어 있다면, 자식 클래스에서 구현부는 안해도 상관없다.
mixin CarInterface2 {
  // 구현부가 없음.
  void sell();
  // super.함수 ->  부모 클래스에서 구현부가 없다면 super의 키워드는 에러가 발생함
  // -> 구현부가 없기 때문에!

  // 자식 클래스에서 구현을 하면 부모 클래스의 구현부는 무시된다.
  void check() {
    print('check');
  }
}
