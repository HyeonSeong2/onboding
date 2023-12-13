// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first/enum/enum_exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first/main.dart';

void main() {
  Animal.bird; // Animal의 bird 타입

  ///switch에서 enum을 쓰기 위해선 .name을 사용 -> String 타입으로 타입캐스팅이 된다.
  switch (Animal.bird.name) {}
}
