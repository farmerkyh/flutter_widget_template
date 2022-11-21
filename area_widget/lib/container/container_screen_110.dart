import 'package:flutter/material.dart';

class ContainerScreen110 extends StatelessWidget {
  const ContainerScreen110({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container")),
      body: SafeArea(
        bottom: false,
        // 예문
        //   - Container -> child 로 Text 사용 시
        // Container
        //   - 자식 Widget이 없을 경우 남아 있는 공간을 모두 찾이 한다.
        //   - 자식 Widget이 없을 경우 크기 지정이 없을 경우 차지할 수 있는 최대의 범위를 가져간다.
        //   - 자식 widget이 있으면 자식 widget size만큼만 찾이 한다.
        //   - SizedBox 와 비교되는 Widget
        //   - 속성 : alignment, padding, color,decoration,foregroundDecoration,width,height,
        //           constraints,margin,transform,transformAlignment,child,clipBehavior
        //   - 사용이유 : SizedBox보다는 속성이 많다.
        //               padding,margin,Decoration등이 필요할 때 주로 사용한다.
        child: Container(
          color: Colors.red,
          child: const Text('Container-Child존재시 Child 영역만 찾이함'),
        ),
      ),
    );
  }
}
