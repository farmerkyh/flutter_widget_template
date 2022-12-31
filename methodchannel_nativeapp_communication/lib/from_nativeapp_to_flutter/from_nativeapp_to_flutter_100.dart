import 'package:flutter/material.dart';
import './methodchanneltest.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Android로부터 수신한 count값을 저장/출력하기 위한 필드
  int _count = 0;

  @override
  void initState() {
    super.initState();
    // MethodChannel 초기화, 요청 수신을 위한 핸들러 등록용
    Methodchanneltest.initMethodChannel(setCountCallback);
  }

  // Android로부터 수신한 count 값을 필드에 반영하기 위한 콜백
  void setCountCallback(int count) {
    setState(() {
      _count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("getCount"),
                onPressed: () {
                  Methodchanneltest.getCount();
                },
              ),
              Text("count: $_count")
            ],
          ),
        ),
      ),
    );
  }
}
