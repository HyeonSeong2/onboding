import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreen extends StatefulWidget {
  const MethodChannelScreen({super.key});

  @override
  State<MethodChannelScreen> createState() => _MethodChannelScreenState();
}

//android 쪽으로 check라는 함수명을 호출
//check라는 함수를 호출, arguments는 first
//성공 하면 print value, 이때 value는 android에서 리턴

class _MethodChannelScreenState extends State<MethodChannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  MethodChannel('android')
                      .invokeMethod('check', 'first')
                      .then((value) => print('value = $value'));
                },
                child: Text("btn1")),
          ],
        ),
      ),
    );
  }
}
