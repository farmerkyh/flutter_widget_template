import 'package:flutter/material.dart';

class GridViewBuilder100 extends StatelessWidget {
  const GridViewBuilder100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.builder'),
        centerTitle: true,
      ),
      //-------------------------------------------------------------------------
      // GridView.builder
      //-------------------------------------------------------------------------
      body: GridView.builder(
        itemCount: 100, //grid에 표현할 item 개수

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율 (default:1/1 = 1:1)
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 30, //수직 Padding
        ),

        //-------------------------------------------------------------------------
        // itemBuilder
        //-------------------------------------------------------------------------
        itemBuilder: (BuildContext context, int index) {
          //item 의 반목문 항목 형성
          debugPrint("index=$index");
          return Container(
            color: Colors.amber[(index * 100)],
            child: Text("GridView.builder.item=$index, amber[${index * 100}]"),
          );
        },
      ),
    );
  }
}
