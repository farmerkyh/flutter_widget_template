import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      // ListView.builder
      //   - 반복적으로 비슷한 형태의 Widget들을 보여줘야 하는 경우에 사용한다.
      //   - (참고, 단순히 for 문이 수행 + 각 index별로 빈 Row + 또는 Column행이 추가 된다.)
      //   - List별 사이에 공간 및 구분자가 필요 없는 경우에 사용
      //   - itemCount 숫자만큼 itemBuilder의 callback 함수가 수행 된다.
      //-------------------------------------------------------------------------
      body: ListView.builder(
        itemCount: 20, //grid에 표현할 item 개수
        //-------------------------------------------------------------------------
        // itemBuilder
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
