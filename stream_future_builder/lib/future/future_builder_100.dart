import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilder100 extends StatefulWidget {
  const FutureBuilder100({Key? key}) : super(key: key);

  @override
  _FutureBuilder100State createState() => _FutureBuilder100State();
}

class _FutureBuilder100State extends State<FutureBuilder100> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      appBar: AppBar(title: Text('FutureBuilder')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<int>(
          future: getNumber(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //데이터가 있을때 위젯 렌더링
            } else if (snapshot.hasError) {
              //데이터가 있을때 위젯 렌더링
            } else {
              //로딩중일때 위젯 렌더링
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
                Text('ConState : ${snapshot.connectionState}', style: textStyle),
                Text('Data : ${snapshot.data}', style: textStyle),
                Text('Error : ${snapshot.error}', style: textStyle),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    // throw Exception('에러가 발생했습니다.');

    return random.nextInt(100);
  }
}
