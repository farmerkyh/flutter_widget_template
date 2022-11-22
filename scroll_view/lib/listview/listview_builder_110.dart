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
      // ListView.builder
      //-------------------------------------------------------------------------
      body: ListView.builder(
        itemCount: months.length * 2, //grid에 표현할 item 개수
        //-------------------------------------------------------------------------
        // itemBuilder
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
