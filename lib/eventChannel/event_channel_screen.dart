import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelScreen extends StatefulWidget {
  const EventChannelScreen({super.key});

  @override
  State<EventChannelScreen> createState() => _EventChannelScreenState();
}

class _EventChannelScreenState extends State<EventChannelScreen> {
  late EventChannel eventChannel = const EventChannel('inhand');
  final MethodChannel methodChannel = MethodChannel('android');

  /// 추상 클래스
  StreamSubscription? streamSubscription;
  int value = 0;
  @override
  void initState() {
    //android 신호를 보냄 -> 그럼 아래 채널로 들어옴.
    //Flutter 채널, Native 채널이 동시에 뜨지 않기 때문에 delay
    Future.delayed(const Duration(seconds: 1), () {
      setEventChannel();
    });
    super.initState();
  }

  //Flutter 채널, Native 채널이 동시에 뜨지 않기 때문에
  void setEventChannel() {
    eventChannel = EventChannel("inhand");
    streamSubscription = eventChannel.receiveBroadcastStream().listen((event) {
      if (event != null && event is int) {
        setState(() {
          value += event as int;
        });
      }
    });
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    streamSubscription = null;
    super.dispose();
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
                  methodChannel.invokeMethod('start');
                },
                child: Text("시작")),
            TextButton(
                onPressed: () {
                  methodChannel.invokeMethod('stop');
                },
                child: Text("끝")),
            Text("value : $value"),
          ],
        ),
      ),
    );
  }
}
