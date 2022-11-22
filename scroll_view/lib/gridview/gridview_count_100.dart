import 'package:flutter/material.dart';

/*
  Desc : GridView.count() Method를 이용해서 격자형태의 화면 구성하기
*/
class GridViewCount100 extends StatelessWidget {
  List<int> amberList = <int>[0, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  GridViewCount100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.count"),
        centerTitle: true,
      ),
      body: Container(
        //-------------------------------------------------------------------------
        // 1. GridView.count
        //       - 자체 속성으로 격자 형태를 정한다. (보통은 gridDelegate가 존재 한다.)
        //-------------------------------------------------------------------------
        child: GridView.count(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          crossAxisSpacing: 20, //수직 Padding
          mainAxisSpacing: 6.0, //수평 Padding
          childAspectRatio: 1.0,

          //-------------------------------------------------------------------------
          // 2. itemBuilder가 존재하지 않으며, count가 존재 하지 않는다.
          //    children하위의 Widget들로 Grid가 구성 된다.
          //-------------------------------------------------------------------------
          children: List.generate(
            amberList.length,
            (index) {
              debugPrint('index=$index');
              return Container(
                color: Colors.amber[amberList[index]],
                child: Text("Color value=amber[${amberList[index]}]"),
              );
              //return Container(color: Colors.amber);
            },
          ),
        ),
      ),
    );
  }
}
