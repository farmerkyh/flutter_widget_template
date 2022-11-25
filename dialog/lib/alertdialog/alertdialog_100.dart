import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: AlertDialog100()));

class AlertDialog100 extends StatefulWidget {
  const AlertDialog100({super.key});

  @override
  _AlertDialog100State createState() => _AlertDialog100State();
}

class _AlertDialog100State extends State<AlertDialog100> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Dialog Open',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              onPressed: () => FlutterDialog(),
            )
          ],
        ),
      ),
    );
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(children: const [Text("Dialog Title")]),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text("Dialog Content")],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
