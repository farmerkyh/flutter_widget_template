import 'package:flutter/material.dart';

/*
  Desc : Column + Row Widget을 이용해서 구성
*/
class ColumnScreen110 extends StatelessWidget {
  const ColumnScreen110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Column+Row")),
      //SafeArea - 상단 상태바 하단 작업바(?)영역을 제외하고 영역을 찾이 하도록 설정
      body: SafeArea(
        bottom: false,
        child: Container(
            color: Colors.black,
            //width: MediaQuery.of(context).size.width,
            //width: double.infinity,
            child: Column(
              // Column - 주측에서 찾이 할 수 있는 공간은 모두 찾이 한다.
              //        - 반대측은 Widget 크기에 따라서 최소한의 크기만 찾이 한다.
              // mainAxisAlignment : 주측 정렬
              //     - start : 시작
              //     - end   : 끝
              //     - center : 가운데
              //     - spaceBetween : 위젯과 위젯의 사이가 동일하게 배치. 끝 양쪽에는 붙는다.
              //     - spaceEvenly : 위젯을 같은 간격으로 배치하지만 끝과 끝에도 위젯이 아닌 빈 간격으로 시작한다.
              //     - spaceAround : spaceEvenly + 끝과 끝의 간격은 1/2
              // crossAxisAlignment : 반대측 정렬
              //     - start : 시작
              //     - end   : 끝
              //     - center : 가운데  (default)
              //     - strech : 최대한으로 늘린다.
              // mainAxisSize : 주측의 크기
              //     - max : 최대 (default)
              //     - min : 최소
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 50.0, width: 50, color: Colors.red),
                    Container(height: 50.0, width: 50, color: Colors.orange),
                    Container(height: 50.0, width: 50, color: Colors.yellow),
                    Container(height: 50.0, width: 50, color: Colors.green),
                  ],
                ),
                Container(height: 50.0, width: 50, color: Colors.orange),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 50.0, width: 50, color: Colors.red),
                    Container(height: 50.0, width: 50, color: Colors.orange),
                    Container(height: 50.0, width: 50, color: Colors.yellow),
                    Container(height: 50.0, width: 50, color: Colors.green),
                  ],
                ),
                Container(height: 50.0, width: 50, color: Colors.green),
              ],
            )),
      ),
    );
  }
}
