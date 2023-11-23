package com.example.first

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // kotlin에서는 ""사용함

        // 1. MethodChannel Handler 생성
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"android").setMethodCallHandler { call, result -> when(call.method){
          // 2. flutter 에서 미리 정해둔 "check" 함수 호출
            "check"->{
                // print(전달 받은 argument)
                println(call.arguments)
                // android -> flutter 리턴 second
                result.success("second")
            }
        }}
    }
}
