import 'package:flutter/material.dart';

class StackScreen110 extends StatelessWidget {
  const StackScreen110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack+Positioned")),
      // 예문
      //   - Positioned을 Stack 밖에 기술 한 경우
      // Stack
      //   - 자식 Widget들을 서로 겹치게 배치할 수 있다.
      //   - Stack안에 포함된 Container 좌표는 0, 0 부터 시작 된다.
      //   - Stack 은 scroll 되지 않습니다.
      //   - Stack에 정렬 순서는 맨 먼저 기술된 Widget이 맨 아래에 배치된다.
      //     맨 마지막에 생성된 위젯이 가장 위로 온다.
      //   - 만약, 맨 마지막의 Widget의 size가 재일 크다면 하위 Widget들은 보이지 않게 된다.
      body: Column(
        children: [
          Stack(
            children: [
              Container(width: 400, height: 150, color: Colors.redAccent),
              Container(width: 350, height: 125, color: Colors.blueAccent),
              Container(width: 250, height: 100, color: Colors.cyanAccent),
              Container(width: 150, height: 75, color: Colors.purpleAccent),
              //Container(width: 450, height: 150, color: Colors.purpleAccent)
            ],
          ),

          /* - Stack 밖으로 Positioned 가 존재 한다면  아래와 같은 Runtime Exception 발생
             - Widget이 그려지기는 함
          The following assertion was thrown while applying parent data.:
          Incorrect use of ParentDataWidget.

          The ParentDataWidget Positioned(top: 0.0) wants to apply ParentData of type StackParentData to a RenderObject, 
          which has been set up to accept ParentData of incompatible type FlexParentData.

          
          Usually, this means that the Positioned widget has the wrong ancestor RenderObjectWidget. 
          Typically, Positioned widgets are placed directly inside Stack widgets.
          The offending Positioned is currently placed inside a Column widget.
          
          The ownership chain for the RenderObject that received the incompatible parent data was:
          ConstrainedBox ← Container ← Positioned ← Column ← KeyedSubtree-[GlobalKey#aa0e4] ← _BodyBuilder ← MediaQuery ← LayoutId-[<_ScaffoldSlot.body>] ← CustomMultiChildLayout ← _ActionsMarker ← ⋯         
          */
          Positioned(
            top: 0,
            child: Container(
              width: 400,
              height: 150,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
