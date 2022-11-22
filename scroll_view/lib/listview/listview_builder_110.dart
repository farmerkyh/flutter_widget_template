import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
  Desc : ListView.builder() Method이용하여 scroll + iten별 구분라인 추가
*/
class ListViewBuilder110 extends StatelessWidget {
  List months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  ListViewBuilder110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
        centerTitle: true,
      ),

      //-------------------------------------------------------------------------
      // 1. ListView.builder
      //-------------------------------------------------------------------------
      body: ListView.builder(
        itemCount: months.length * 2, //grid에 표현할 item 개수

        //-------------------------------------------------------------------------
        // 2. itemBuilder속성에 의해 for형식의 반복문이 itemCount 수 만큼 호출 된다.
        //      - 개발테크닉으로 item별 중간에 Divider()라인을 추가한다.
        //-------------------------------------------------------------------------
        itemBuilder: (BuildContext context, int index) {
          debugPrint('index=$index');
          int realIndex = index ~/ 2; //몫구하기
          return index.isOdd
              ? const Divider()
              : Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: Text("GridView.builder.item=${months[realIndex]}"),
                );
        },
      ),
    );
  }
}
