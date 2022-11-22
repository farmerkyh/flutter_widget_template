import 'package:flutter/material.dart';

/*
  Desc : Container + ListView Widget을 이용해서 구성
*/
class ListViewContainer100 extends StatelessWidget {
  const ListViewContainer100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container + ListView")),
      body: Container(
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (BuildContext context, int index) {
              return Text("item - $index");
            }),
      ),
    );
  }
}
