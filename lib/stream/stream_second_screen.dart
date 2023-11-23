import 'dart:async';

import 'package:flutter/material.dart';

class StreamSecondScreen extends StatefulWidget {
  const StreamSecondScreen({required this.streamController, super.key});

  final StreamController<int> streamController;

  @override
  State<StreamSecondScreen> createState() => _StreamSecondScreenState();
}

class _StreamSecondScreenState extends State<StreamSecondScreen> {
  int value = 0;
  @override
  void initState() {
    widget.streamController.stream.listen((event) {
      setState(() {
        value += event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("value = $value"),
            TextButton(
              onPressed: () {
                widget.streamController.add(1);
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
