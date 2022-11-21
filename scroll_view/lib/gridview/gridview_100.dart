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
          Container(width: 10, color: Colors.yellow, child: Text('Text' * 100)),
          Container(height: 10, color: Colors.blue, child: const Text('Text')),
          Container(width: 1000, color: Colors.yellow, child: Text('Text' * 100)),
          Container(height: 1000, color: Colors.blue, child: const Text('Text')),
          Container(width: 1000, color: Colors.yellow, child: Text('Text' * 100)),
          Container(height: 1000, color: Colors.blue, child: const Text('Text')),
          Container(width: 1000, color: Colors.yellow, child: Text('Text' * 100)),
          Container(height: 1000, color: Colors.blue, child: const Text('Text'))
        ],
      ),
    );
  }
}
