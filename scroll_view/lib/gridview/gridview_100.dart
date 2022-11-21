import 'package:flutter/material.dart';

class GridView100 extends StatelessWidget {
  const GridView100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.builder'),
        centerTitle: true,
      ),
      //-------------------------------------------------------------------------
      // GridView
      //   - 격자형태로 Widget을 정렬하는 Widget이다.
      //   - scrollDirection 속성에 따라서 좌,우로 화면의 영역를 벗어날 경우 scroll이 되도록 해주는 Widget이다.
      //   - children속성에 기술된 Widget을 기준으로 격자형태로 정렬해준다.
      // gridDelegate
      //   - 격자형태에 대한 구분값들이다.
      //   - children내부에 width, height값들은 의미가 없다.
      //   - width, height에 대한 size는 모두 childAspectRatio 속성값에 의해 정해진다.
      // 특징 (ListView와 동일 특징)
      //   - 화면에 보여지는 item만 렌더링을 진행한다.
      //   - 사용자가 scroll을 하면 그때 추가 렌더링을 진행한다.
      //   - 살아진 widget들은 메모리에서 삭제 된다. 그런 후 다시 보려고 scroll하면 재렌더링 된다.
      //   - GridView() widget은 되는지 테스트 못해 봤음
      //   - GridView.builder, ListView.separated 에서는 위와 같은 렌더링 특징을 가지고 있음.
      //
      //   * GridView.counter, GridView.extent는 모든 Widget이 렌더링됨 (144개 까지 테스트)
      //-------------------------------------------------------------------------
      body: GridView(
        scrollDirection: Axis.vertical,
        //-------------------------------------------------------------------------
        // gridDelegate
        //-------------------------------------------------------------------------
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율 (default:1/1 = 1:1)
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 30, //수직 Padding
        ),
        children: [
          Container(width: 10, child: Text('Text' * 100), color: Colors.yellow),
          Container(height: 10, child: Text('Text'), color: Colors.blue),
          Container(
              width: 1000, child: Text('Text' * 100), color: Colors.yellow),
          Container(height: 1000, child: Text('Text'), color: Colors.blue),
          Container(
              width: 1000, child: Text('Text' * 100), color: Colors.yellow),
          Container(height: 1000, child: Text('Text'), color: Colors.blue),
          Container(
              width: 1000, child: Text('Text' * 100), color: Colors.yellow),
          Container(height: 1000, child: Text('Text'), color: Colors.blue)
        ],
      ),
    );
  }
}
