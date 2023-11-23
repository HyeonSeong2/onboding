import 'package:flutter/material.dart';

import '../car/benz.dart';

class FutureClass extends StatefulWidget {
  const FutureClass({super.key});

  @override
  State<FutureClass> createState() => _FutureClassState();
}

//Future do while, value
class _FutureClassState extends State<FutureClass> {
  // 위젯 작성 프로토콜
  // 들어가는 순서대로 함수를 작성.
  // 위젯들이 들어가는 순서도 참고해서 작성함.

  // structure에서 함수의 모형을 확인 할 수 있음

  final Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () async {
            stopwatch.start();
            await delay1000();
            await delay2000();
            await delay3000();

            // 6초 딜레이 후 아래 코드 실행
            print("6초 후 실행");
            // Future.wait는 future함수를 여러개 실행 시킬 수 있음.
            // Future.wait는 내부 함수 실행 이후 결과 값이 wait의 배열로 들어온다.
            var list = await Future.wait(
              [
                delay1000(),
                delay2000(),
                delay3000(),
              ],
            );
            //print('list : $list');
            print('doSomething( executed in ${stopwatch.elapsed}');
            stopwatch
              ..stop()
              ..reset();
          },
          child: Text("실행"),
        ),
      ),
    );
  }

  Widget _body() {
    // 메서드로 빠진 위젯들은 아래에 작성을 함.
    return Column();
  }

// future Value
  Future<String> futureValue(Future<int> futureInt) {
    return Future.value("value");
  }

  // future Delayed
  Future<void> delay1000() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    print("delay1000 time ${stopwatch.elapsed}");
  }

  Future<void> delay2000() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    print("delay2000 time ${stopwatch.elapsed}");
  }

  Future<void> delay3000() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    print("delay3000 time ${stopwatch.elapsed}");
  }
}
