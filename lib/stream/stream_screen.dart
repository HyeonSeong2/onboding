import 'dart:async';

import 'package:flutter/material.dart';

///Stream, StreamController,
class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  int value = 0;

  final streamController = StreamController<int>();
  onListen() {
    print("onListen");
  }

  onResume() {
    print("onResume");
  }

  onPaues() {
    print("onPaues");
  }

  onCancel() {
    print("onCancel");
  }

  @override
  void initState() {
    //StreamController은 stream안에 있기 때문에 stream을 넣어야 listen가능
    streamController.onResume?.call();
    streamController.stream.listen((event) {
      print('Listen : $event');
      value += event;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              streamController.add(2);
              //take(9) 10번중 9번을 받음
              //takeWhile -> takeWhile는 false를 받아도 종료 안된다.
              // countStream(10).listen((event) {
              //   setState(() {
              //     value = event;
              //   });
              // });

              ///짝수 출력
              // countStream(10)
              //     .take(9) // 9번 실행
              //     .takeWhile((element) => element <= 7) // 7보다 작거나 같으면 true
              //     .where((event) => event.isEven)
              //     .listen((event) {
              //   print(event);
              //   setState(() {
              //     value = event;
              //   });
              // });
            },
            child: Text("실행 ${value}"),
          ),
          TextButton(
              onPressed: () {
                streamController.addStream(countStream(4));
              },
              child: Text("addStream")),
        ],
      ),
    );
  }

  ///listen으로 읽고 있음 -> yield 알려줌 -> setState
  /// Stream - <t> 제네릭 타입을 받음
  /// 주석으로 이해하기 쉽게 작성 노력하기
  /// Stream은 async*을 사용한다.
  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      await Future.delayed(const Duration(milliseconds: 300));

      /// Stream은 yield,asynce* 세트
      /// yield = 소리치다
      yield i;
    }
  }
}
