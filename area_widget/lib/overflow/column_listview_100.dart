import 'package:flutter/material.dart';

/*
  Desc : Scaffold + Column + ListView Widget을 이용해서 구성
  수행결과 : 오류 (Vertical viewport was given unbounded height.)
*/
class ColumnListView100 extends StatelessWidget {
  const ColumnListView100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column + ListView")),
      body: Column(
        children: [
          ListView.builder(
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                return Text("item - $index");
              }),
        ],
      ),
    );
  }
}
