/*
singleChildScrollView 안에 있는 위젯들은 모두 랜더링이 완료가 된 상태다.
즉, 데이터가 100개를 소유하고 있다면 100개가 다 완료되고 나서 앱은 화면을 보여준다.
*/
import 'package:flutter/material.dart';

/*
  Desc : SingleChildScrollView() Widget을 이용해서 child에 존재하는 Widget들을 scroll 기능 구현하기 + 화면에 2개 구현
           - 위쪽 Widget은 상/하 scroll
           - 아래쪽 Widget은 좌/우 scroll
*/
class SingleChildScrollView110 extends StatelessWidget {
  const SingleChildScrollView110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView(110)'),
        centerTitle: true,
      ),
      //Center, Container, Expanded, SizedBox 는 정상 (항상은 아닌듯?? ㅋㅋ)
      //Column, Expanded, Row 는 오류 (항상은 아닌듯?? ㅋㅋ)
      body: Column(
        children: [
          Expanded(
            //-------------------------------------------------------------------------
            // 1. SingleChildScrollView (상/하 scroll)
            //-------------------------------------------------------------------------
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,

              //-------------------------------------------------------------------------
              // 2. child
              //    - child하위의 Widget들로 scroll item을 구성 한다.
              //-------------------------------------------------------------------------
              child: Column(
                children: [
                  Container(height: 150, color: Colors.amberAccent),
                  Container(height: 150, color: Colors.blueAccent),
                  Container(height: 150, color: Colors.redAccent),
                  Container(height: 150, color: Colors.greenAccent),
                  Container(height: 150, color: Colors.cyanAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              color: Colors.grey,
              //-------------------------------------------------------------------------
              // 3. SingleChildScrollView (좌/우 scroll)
              //-------------------------------------------------------------------------
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('옆으로 가자  --> ' * 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
