/*
singleChildScrollView 안에 있는 위젯들은 모두 랜더링이 완료가 된 상태다.
즉, 데이터가 100개를 소유하고 있다면 100개가 다 완료되고 나서 앱은 화면을 보여준다.
*/
import 'package:flutter/material.dart';

class SingleChildScrollView110 extends StatelessWidget {
  const SingleChildScrollView110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView(110)'),
        centerTitle: true,
      ),
      //Center, Container, SizedBox 는 정상
      //Column, Expanded, Row 는 오류
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('옆으로 가자 ' * 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
