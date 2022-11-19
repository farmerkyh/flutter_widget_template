import 'package:flutter/material.dart';

class StackScreen130 extends StatelessWidget {
  const StackScreen130({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack+Positioned")),
      // 예문
      //   - Stack2개 사용 시
      //   - (Stack+Position) + (Stack+Position) 과 같이 2개는 오류 발생
      // Stack
      //   - 자식 Widget들을 서로 겹치게 배치할 수 있다.
      //   - Stack안에 포함된 Container 좌표는 0, 0 부터 시작 된다.
      //   - Stack 은 scroll 되지 않습니다.
      //   - Stack에 정렬 순서는 맨 먼저 기술된 Widget이 맨 아래에 배치된다.
      //     맨 마지막에 생성된 위젯이 가장 위로 온다.
      //   - 만약, 맨 마지막의 Widget의 size가 재일 크다면 하위 Widget들은 보이지 않게 된다.
      // Container
      //   - 보통 Container는 Child widget size에 정해진다.
      //   - Stack은 남은 모든 공간을 찾이하고 있다.
      //   - 아래 예문에서 Container 대신 Row,Column을 사용하면 Error발생 (이유???)
      body: Container(
        color: Colors.grey,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child:
                  Container(width: 450, height: 150, color: Colors.redAccent),
            ),
            Positioned(
              top: 100,
              child:
                  Container(width: 350, height: 125, color: Colors.blueAccent),
            ),
            Positioned(
              top: 200,
              child:
                  Container(width: 250, height: 100, color: Colors.cyanAccent),
            ),
            Positioned(
              top: 250,
              child:
                  Container(width: 150, height: 75, color: Colors.purpleAccent),
            ),
          ],
        ),
      ),
      // body: Container(
      //   children: [
      //     //Container(height: 100, child: Text('상단공간')),
      //     Stack(
      //       children: [
      //         Positioned(
      //           top: 0,
      //           child:
      //               Container(width: 450, height: 150, color: Colors.redAccent),
      //         ),
      //         Positioned(
      //           top: 100,
      //           child: Container(
      //               width: 350, height: 125, color: Colors.blueAccent),
      //         ),
      //         Positioned(
      //           top: 200,
      //           child: Container(
      //               width: 250, height: 100, color: Colors.cyanAccent),
      //         ),
      //         Positioned(
      //           top: 300,
      //           child: Container(
      //               width: 150, height: 75, color: Colors.purpleAccent),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
