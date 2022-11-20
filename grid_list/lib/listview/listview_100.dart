import 'package:flutter/material.dart';

class ListView100 extends StatelessWidget {
  const ListView100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
        centerTitle: true,
      ),
      //-------------------------------------------------------------------------
      // ListView
      //   - ListView자체는 보여주는 Widget은 아니고, 스크롤을 해주는 위젯을 생성한다.
      //   - children에 속한 Widget들이 화면의 영역를 벗어날 경우 scroll이 되도록 해주는 Widget이다.
      //   - 한번만 수행한다.
      //   - 사용자에게 보여주고 싶다면 Text, image등의 Widget을 추가 해야 된다.
      //   - scrollDirection 속성 : 으로 scroll방향 설정 (Axis.horizontal, Axis.vertical)
      // 특징
      //   - 화면에 보여지는 item만 렌더링을 진행한다.
      //   - 사용자가 scroll을 하면 그때 추가 렌더링을 진행한다.
      //   - 살아진 widget들은 메모리에서 삭제 된다. 그런 후 다시 보려고 scroll하면 재렌더링 된다.
      //   - ListView() widget은 되는지 테스트 못해 봤음
      ///  - ListView.builder, ListView.separated 에서는 위와 같은 렌더링 특징을 가지고 있음.
      //-------------------------------------------------------------------------
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(height: 500, color: Colors.grey),
          Container(height: 500, color: Colors.yellow),
          Container(height: 500, color: Colors.blue),
        ],
      ),
    );
  }
}
