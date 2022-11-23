import 'package:flutter/material.dart';

/*
  Desc : Scaffold + Container + ListView Widget을 이용해서 구성
  수행결과 : 정상
*/
class ContainerListView100 extends StatelessWidget {
  const ContainerListView100({super.key});

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
