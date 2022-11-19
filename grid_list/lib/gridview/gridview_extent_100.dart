import 'package:flutter/material.dart';

class GridViewExtent100 extends StatelessWidget {
  List<int> amberList = <int>[0, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  GridViewExtent100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.count"),
        centerTitle: true,
      ),
      body: Container(
        //----------------------------------------------------------------------------------------------
        // 1. extent
        //----------------------------------------------------------------------------------------------
        child: GridView.extent(
          //crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          maxCrossAxisExtent: 100.0, //item 하나의 최대 width size지정 (최대 사이즈로 레이아웃을 채운다.)
          crossAxisSpacing: 20, //수직 Padding
          mainAxisSpacing: 6.0, //수평 Padding
          childAspectRatio: 1.0,

          //----------------------------------------------------------------------------------------------
          // 2. children: List.generate
          //----------------------------------------------------------------------------------------------
          children: List.generate(
            amberList.length,
            (index) {
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
