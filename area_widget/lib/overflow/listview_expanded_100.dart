import 'package:flutter/material.dart';

/*
  Desc : Expanded + ListView Widget을 이용해서 구성
*/
class ListViewExpanded100 extends StatelessWidget {
  const ListViewExpanded100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded + ListView")),
      body: Container(
        //height: 10,
        child: Text('10000' * 1000),
      ),
    );
  }
}
