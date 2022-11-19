import 'package:flutter/material.dart';

class ContainerScreen100 extends StatelessWidget {
  const ContainerScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: SafeArea(
        bottom: false,
        // 예문
        //   - Container 1개만 사용 시
        // Container
        //   - 자식 Widget이 없을 경우 남아 있는 공간을 모두 찾이 한다.
        //   - 자식 Widget이 없을 경우 크기 지정이 없을 경우 차지할 수 있는 최대의 범위를 가져간다.
        child: Container(color: Colors.red),
      ),
    );
  }
}
