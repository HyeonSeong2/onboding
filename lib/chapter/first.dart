abstract class Car{
  double price;
  String carName;
  String owner;

  Car(
      this.price,
      this.carName,
      this.owner,
      );

  // void run(String carName){
  //   return print("$carName이 달리고 있습니다.");
  // }

  void run(String carName){
    return print("$carName이 달리고 있습니다.");
  }

  void stop(String carName){
    return print("$carName이 정지했습니다.");
  }
}

