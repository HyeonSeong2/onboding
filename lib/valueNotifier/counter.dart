import 'package:flutter/cupertino.dart';

class Counter {
  ValueNotifier<int> count = ValueNotifier<int>(0);
  void add() {
    count.value++;
    print("value : ${count}");
  }
}
