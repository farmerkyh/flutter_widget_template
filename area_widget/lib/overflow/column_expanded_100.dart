import 'package:flutter/material.dart';

/*
  Desc : Column + ListView Widget을 이용해서 구성
  수행결과 : 오류 (Vertical viewport was given unbounded height.)
*/
class ColumnExpanded100 extends StatelessWidget {
  const ColumnExpanded100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column + ListView")),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.blue, child: Text('첫번째 Expanded--- 100번' * 100)),
          ),
          Expanded(child: Text('두번째 Expanded--- 200번' * 200)),
          Expanded(
            child: Container(color: Colors.amber, child: Text('세번째 Expanded--- 300번' * 200)),
          ),
        ],
      ),
    );
  }
}
