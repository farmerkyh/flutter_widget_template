import 'package:flutter/material.dart';

/*
  Desc : GridView.custom() Method를 이용해서 격자형태의 화면 구성하기
*/
class GridViewCustom100 extends StatelessWidget {
  const GridViewCustom100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView.custom"),
        centerTitle: true,
      ),
      body: Container(
        //----------------------------------------------------------------------------------------------
        // 1. custom
        //----------------------------------------------------------------------------------------------
        child: GridView.custom(
          //----------------------------------------------------------------------------------------------
          // 2. childrenDelegate
          //    - item 하나하나의 속성
          //----------------------------------------------------------------------------------------------
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text('Widget $index'),
              );
            },
            childCount: 200,
          ),

          //----------------------------------------------------------------------------------------------
          // 3. gridDelegate
          //    - SliverGridDelegateWithFixedCrossAxisCount : 교차 축의 자식 수
          //    - SliverGridDelegateWithMaxCrossAxisExtent  : 자식에 대한 최대 교차 축 공간 (우리가 사용하는 것과 동일 GridView.extent)
          //----------------------------------------------------------------------------------------------
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}
