package com.example.first

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel



//EventChannel Study

//kotlin은 변수 : 타입
class EventChannelHandler (binaryMessenger: BinaryMessenger,name: String) : EventChannel.StreamHandler{

    //클래스 생성

    var eventChannel: EventChannel? = null


    //sink가 dart에 보내는 역할을 한다.
    var eventSink: EventChannel.EventSink? = null

    //init : 클래스생성할때 타겟 함수
    init {
        //채널 생성
         eventChannel = EventChannel(binaryMessenger,name)
        // Dart ! = Kotlin !!
        eventChannel!!.setStreamHandler(this)// StreamHandler를 상속받았기 때문에 this 로 가능
         }


    // Listen -> eventSink가 들어옴
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        if(events != null){
            eventSink = events
        }
    }

    override fun onCancel(arguments: Any?) {
        if (arguments != null){
            sink(arguments)
        }
    }
    //Any : 모든 타입을 받을 수 있음.
    fun sink(value : Any){
        //UI스레드, 백그라운드 스레드등이 있음 -> 핸들러로 감싸줘서 해결
        // 성공 시 dart에 value를 전달
        Handler(Looper.getMainLooper()).post{
            eventSink?.success(value)
        }
    }


}