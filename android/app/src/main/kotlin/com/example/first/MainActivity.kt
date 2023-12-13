package com.example.first

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Timer
import kotlin.concurrent.timer

class MainActivity: FlutterActivity() ,MethodChannel.Result { // dart에서 implement -> kotlin에서 ,와 같음.

    //EventChannel Study
    var eventChannelHandler: EventChannelHandler? = null
    var channelTimer: Timer? = null


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // kotlin에서는 ""사용함
        eventChannelHandler = EventChannelHandler(flutterEngine.dartExecutor.binaryMessenger,"inhand")


        // 1. MethodChannel Handler 생성
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"android").setMethodCallHandler { call, result -> when(call.method){
          // 2. flutter 에서 미리 정해둔 "check" 함수 호출
            "check"->{
                // print(전달 받은 argument)
                println(call.arguments)
                // android -> flutter 리턴 second
                result.success("second")
            }
            //2일차
            "callBack" ->{
                    MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"androidNative").invokeMethod("nativeCall", mapOf("data" to "value","aaa" to "bbb"),this@MainActivity)
            }

            //EventChannel Study
            "start"->{
                println("start 진입")
                //2초마다 전송
                channelTimer = timer(period = 2000){
                    eventChannelHandler?.sink(1)
                }
            }
            "stop"->{
                channelTimer?.cancel()
                channelTimer = null
            }
        }
        }
    }

    override fun success(result: Any?) {
        //logm 단축키
        Log.d(TAG, "success() called with: result = $result")
    }

    override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
        Log.d(TAG, "error() called with: errorCode = $errorCode, errorMessage = $errorMessage, errorDetails = $errorDetails")
    }

    override fun notImplemented() {
    }

    companion object { // companion = static 과 동일한 키워드
        private const val TAG = "MainActivity"
    }

}
