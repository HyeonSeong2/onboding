import 'package:first/valueNotifier/counter.dart';
import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatefulWidget {
  const ValueNotifierScreen({super.key});

  @override
  State<ValueNotifierScreen> createState() => _ValueNotifierScreenState();
}

class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  @override
  Widget build(BuildContext context) {
    final Counter counter = Counter();
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueNotifier"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter.count,
              builder: (BuildContext context, value, Widget? child) {
                return Text("${value}");
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                counter.add();
              },
            ),
          ],
        ),
      ),
    );
  }
}
