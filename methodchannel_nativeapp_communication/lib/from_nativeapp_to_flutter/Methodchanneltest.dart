import 'dart:async';
import 'package:flutter/services.dart';

class Methodchanneltest {
  // 안드로이드와 메소드 호출 통신을 위한 메소드 채널
  static const MethodChannel _channel =
      const MethodChannel('methodchanneltest');

  // 안드로이드로부터 수신한 count 값을 갱신하기 위한 콜백
  static Function(int count)? callback;

  // 메소드채널에 안드로이드로부터의 메소드 호출을 수신할 핸들러 등록
  static void initMethodChannel(void Function(int count) setCountCallback) {
    _channel.setMethodCallHandler(handler);
    callback = setCountCallback;
  }

  // 안드로이드로 카운트를 요청하기 위한 메소드
  static void getCount() async {
    await _channel.invokeMethod('getCount');
  }

  // 안드로이드로부터의 메소드 호출을 수신하는 핸들러
  static Future<dynamic> handler(MethodCall call) async {
    switch (call.method) {
      // count 값을 수신하는 메소드 호출인 경우
      case "pushCount":
        var count = call.arguments;
        // 수신한 카운트 값을 콜백을 통해 화면에 갱신
        callback!(count);
        break;
      default:
        throw ("method not defined");
    }
  }
}
