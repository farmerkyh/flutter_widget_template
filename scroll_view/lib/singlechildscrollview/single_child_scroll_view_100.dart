import 'package:flutter/material.dart';

/*
  Desc : SingleChildScrollView() Widget을 이용해서 child에 존재하는 Widget들을 scroll 기능 구현하기
*/
class SingleChildScrollView100 extends StatelessWidget {
  const SingleChildScrollView100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView(100)'),
        centerTitle: true,
      ),
      //Center, Container, SizedBox 는 정상 (항상은 아닌듯?? ㅋㅋ)
      //Column, Expanded, Row 는 오류 (항상은 아닌듯?? ㅋㅋ)
      body: Container(
        //-------------------------------------------------------------------------
        // 1. SingleChildScrollView
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
    );
  }
}
