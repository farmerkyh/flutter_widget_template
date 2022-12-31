import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
  @desc flutter에서 native app에 자료를 요청 후 결과를 받는다.
        native app에서 naver를 띄우도록 호출 한다.
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FromFlutterToNativeApp(),
    );
  }
}

class FromFlutterToNativeApp extends StatefulWidget {
  const FromFlutterToNativeApp({super.key});
  //MethodChannel id : samples.flutter.dev/battery
  static const platform = MethodChannel('samples.flutter.dev/battery');

  @override
  State<FromFlutterToNativeApp> createState() => _FromFlutterToNativeAppState();
}

class _FromFlutterToNativeAppState extends State<FromFlutterToNativeApp> {
// NativeApp에서 수신한 내용
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      //MethodChannel invokeMethod : getBatteryLevel
      final int result =
          await FromFlutterToNativeApp.platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  _browserNaver() async {
    await FromFlutterToNativeApp.platform.invokeMethod('browserNaver');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery Level'),
            ),
            Text(_batteryLevel),
            ElevatedButton(
              onPressed: _browserNaver,
              child: const Text('Open browser'),
            ),
          ],
        ),
      ),
    );
  }
}
