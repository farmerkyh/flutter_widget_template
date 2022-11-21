import 'package:flutter/material.dart';

class GridViewExtent100 extends StatelessWidget {
  List<int> amberList = <int>[
    0,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
  ];
  List<Color> colorList = [
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.brown
  ];
  GridViewExtent100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.extent"),
        centerTitle: true,
      ),
      body: Container(
        //---------------------------------------------------------------------
        // GridView.extent
        //    - GridView의 생성자, GridView.count와 거의 동일하다.
        //    - 가로 혹은 세로를 채울 Widget의 개수를 하나의 Widget의 너비를 통해 동적으로 구한다.
        // maxCrossAxisExtent (필수)
        //    - 한개의 그리드 아이템의 최대넓이(최소?) 값으로 로우 혹은 컬럼의 갯수 자동계산 된다.
        //    - crossAxisCount 와 같은 속성이 없다.
        //---------------------------------------------------------------------
        // child: GridView.extent(
        //     maxCrossAxisExtent: 90.0,
        //     crossAxisSpacing: 4.0,
        //     mainAxisSpacing: 8.0,
        //     childAspectRatio: 1.0,
        //     children: List.generate(colorList.length, (index) {
        //       debugPrint("extent index=$index");
        //       return Container(
        //         color: colorList[index],
        //         child: Text("List item :: $index"),
        //       );
        //     })),
        child: GridView.extent(
          //crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          maxCrossAxisExtent:
              100.0, //item 하나의 최대 width size지정 (최대 사이즈로 레이아웃을 채운다.)
          crossAxisSpacing: 20, //수직 Padding
          mainAxisSpacing: 6.0, //수평 Padding
          childAspectRatio: 1.0,

          children: List.generate(
            amberList.length,
            (index) {
              debugPrint("extent index=$index");
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
