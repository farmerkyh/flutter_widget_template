import 'package:flutter/material.dart';

/*
  Desc : Column + ListView Widget을 이용해서 구성
*/
class ListViewColumn100 extends StatelessWidget {
  const ListViewColumn100({super.key});

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
