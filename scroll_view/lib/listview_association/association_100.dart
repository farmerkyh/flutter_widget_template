import 'package:flutter/material.dart';

/*
  Desc : Scaffold + Text Widget을 이용해서 구성
*/
class Association100 extends StatelessWidget {
  const Association100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scaffold + Text")),
      body: Text('[[ 글자가 Scaffold()..화면 넘어도 overflow발생 안함 ]] ------' + '잘 될까???' * 1000),
    );
  }
}
