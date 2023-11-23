import 'dart:async';

import 'package:first/stream/stream_second_screen.dart';
import 'package:flutter/material.dart';

class MultipleScreen extends StatefulWidget {
  const MultipleScreen({super.key});

  @override
  State<MultipleScreen> createState() => _MultipleScreenState();
}

class _MultipleScreenState extends State<MultipleScreen> {
  int value = 0;

  final streamController = StreamController<int>.broadcast(
    onListen: () {
      print('onListen');
    },
    onCancel: () {
      print('onCancel');
    },
  );

  @override
  void initState() {
    streamController.stream.listen((event) {
      setState(() {
        ///리스너가 여러개 가능하기 때문에 type - dynamic이 된다
        /// 해결방안 1. controller에 타입 명시적 선언
        value += event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("value = $value"),
            TextButton(
                onPressed: () {
                  streamController.add(1);
                },
                child: Text("Add")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StreamSecondScreen(
                            streamController: streamController)),
                  );
                },
                child: Text("Move")),
          ],
        ),
      ),
    );
  }
}
