import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
  Desc : ListView.builder() Method이용하여 scroll이 되도록 처리
*/
class ListViewBuilder100 extends StatelessWidget {
  const ListViewBuilder100({super.key});

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
        itemCount: 20, //grid에 표현할 item 개수

        //-------------------------------------------------------------------------
        // 2. itemBuilder속성에 의해 for형식의 반복문이 itemCount 수 만큼 호출 된다.
        //-------------------------------------------------------------------------
        itemBuilder: (BuildContext context, int index) {
          debugPrint('index=$index');
          //item 의 반목 항목 형성
          return Container(
            height: (index + 1) * 20,
            color: Colors.amber[(index * 100)],
            child: Text("GridView.builder.item=$index, amber[${index * 100}]"),
          );
        },
      ),
    );
  }
}
