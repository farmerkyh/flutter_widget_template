import 'package:flutter/material.dart';

class ListViewBuilder100 extends StatelessWidget {
  const ListViewBuilder100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
        centerTitle: true,
      ),
      //-------------------------------------------------------------------------
      // ListView.builder
      //-------------------------------------------------------------------------
      body: ListView.builder(
        itemCount: 10, //grid에 표현할 item 개수

        //-------------------------------------------------------------------------
        // itemBuilder
        //-------------------------------------------------------------------------
        itemBuilder: (BuildContext context, int index) {
          //item 의 반목문 항목 형성
          return Container(
            height: (index + 1) * 20,
            color: Colors.amber[(index * 100)],
            child: Text("GridView.builder.item=$index, amber[${index * 100}]"),
          );
        },
      ),
    );
  }
}
