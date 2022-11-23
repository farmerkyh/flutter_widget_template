import 'package:flutter/material.dart';

/*
  Desc : Scaffold + Text Widget을 이용해서 구성
*/
class ScaffoldText100 extends StatelessWidget {
  const ScaffoldText100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scaffold + Text")),
      body: Text('[[ 글자가 Scaffold()..화면 넘어도 overflow발생 안함 ]] ------' * 1000),
    );
  }
}
