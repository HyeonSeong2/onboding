import 'package:first/chapter/first.dart';
import 'package:first/util/pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//setting -> Live Templets
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// 두가지로 구분을 지을 수 있음.
// 레이아웃 위젯 : 형태 및 간격을 잡는 위젯
// child가 없는 위젯 :
class _HomeScreenState extends State<HomeScreen>{

  // 인스턴스 : 생성자를 생성해서 메모리에 올리는 것
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        width: 300,
        height: 300,
        color: Colors.red,
        //-1,0,1
        //alignment: Alignment.topLeft,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
