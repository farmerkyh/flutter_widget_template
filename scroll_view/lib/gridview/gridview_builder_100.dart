import 'package:flutter/material.dart';

/*
  Desc : GridView.builder() Method를 이용해서 격자형태의 화면 구성하기
*/
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
      // 1. GridView.builder
      //-------------------------------------------------------------------------
      body: GridView.builder(
        itemCount: 100, //grid에 표현할 item 개수

        //-------------------------------------------------------------------------
        // 2. gridDelegate 속성에 의해 격자 형태를 정한다.
        //-------------------------------------------------------------------------
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율 (default:1/1 = 1:1)
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 30, //수직 Padding
        ),

        //-------------------------------------------------------------------------
        // 3. itemBuilder속성에 의해 for형식의 반복문이 itemCount 수 만큼 호출 된다.
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
