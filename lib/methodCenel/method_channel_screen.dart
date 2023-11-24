import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 면접때 메서드 채널 많이 물어봄 -> flutter <-> kotlin
class MethodChannelScreen extends StatefulWidget {
  const MethodChannelScreen({super.key});

  @override
  State<MethodChannelScreen> createState() => _MethodChannelScreenState();
}

//android 쪽으로 check라는 함수명을 호출
//check라는 함수를 호출, arguments는 first
//성공 하면 print value, 이때 value는 android에서 리턴
/// ListView , Single View 차이점 중요!
/// 사용,

class _MethodChannelScreenState extends State<MethodChannelScreen> {
  @override
  void initState() {
    ///2일차
    //androidNative라는 채널에 핸들러를 등록
    MethodChannel('androidNative').setMethodCallHandler((call) async {
      //return 타입이 Future이다
      // ->2가지 방안이 있음. 1. Future.value, 2.async
      print("call.method : ${call.method}");
      switch (call.method) {
        case "nativeCall":
          print(
              'call.arguments : ${call.arguments}'); // option + shift + 방향키 : 코드 잡고 위아래로 움직임
          break;
      }
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
            TextButton(
                onPressed: () {
                  MethodChannel('android')
                      .invokeMethod('check', 'first')
                      .then((value) => print('value = $value'));
                },
                child: Text("btn1")),

            ///2일차
            TextButton(
                onPressed: () {
                  //android라는 channel에 callBack라는 함수를 호출
                  MethodChannel('android').invokeMethod('callBack');
                },
                child: Text("Native Btn")),
          ],
        ),
      ),
    );
  }
}
