import 'package:flutter/material.dart';

/*
  Desc : SizedBox + ListView Widget을 이용해서 구성
*/
class ListViewSizedBox100 extends StatelessWidget {
  const ListViewSizedBox100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container + ListView")),
      body: SizedBox(
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (BuildContext context, int index) {
              return Text("item - $index");
            }),
      ),
    );
  }
}
