import 'package:flutter/material.dart';

class StackScreen100 extends StatelessWidget {
  const StackScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack")),
      // 예문
      //   - Stack 사용 시
      // Stack
      //   - 자식 Widget들을 서로 겹치게 배치할 수 있다.
      //   - Stack안에 포함된 Container 좌표는 0, 0 부터 시작 된다.
      //   - Stack 은 scroll 되지 않습니다.
      //   - Stack에 정렬 순서는 맨 먼저 기술된 Widget이 맨 아래에 배치된다.
      //     맨 마지막에 생성된 위젯이 가장 위로 온다.
      //   - 만약, 맨 마지막의 Widget의 size가 재일 크다면 하위 Widget들은 보이지 않게 된다.

      body: Stack(
        children: [
          Container(width: 450, height: 150, color: Colors.redAccent),
          Container(width: 350, height: 125, color: Colors.blueAccent),
          Container(width: 250, height: 100, color: Colors.cyanAccent),
          Container(width: 150, height: 75, color: Colors.purpleAccent),
        ],
      ),
    );
  }
}
