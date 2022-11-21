import 'package:flutter/material.dart';

class ExpandedScreen110 extends StatelessWidget {
  const ExpandedScreen110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded")),
      body: SafeArea(
        bottom: false,
        // 예문
        //   - Expanded 3개, 하나는 Width 안줌 경우
        //Expanded
        //  - 주측(Column)을 기준으로 Expanded 비율만큼 균등 분할됨.(height)
        //  - 상태측은 size가 존재 하면, 해당 size만큼, 없을경우 전체를 찾이 한다.
        //  - Expended Widget을 child로 가질 수 있는 Widget : Column, Row, flex
        child: Column(
          children: [
            Expanded(
              child: Container(color: Colors.red, width: 50.0, height: 50.0),
            ),
            Expanded(
              child: Container(color: Colors.black),
            ),
            Expanded(
              child: Container(color: Colors.blue, width: 50.0, height: 50.0),
            ),
          ],
        ),
      ),
    );
    //);
  }
}
