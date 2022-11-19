import 'package:flutter/material.dart';

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
        child: GridView.count(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          crossAxisSpacing: 20, //수직 Padding
          mainAxisSpacing: 6.0, //수평 Padding
          childAspectRatio: 1.0,
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
