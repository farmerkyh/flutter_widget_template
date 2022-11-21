import 'package:flutter/material.dart';

class SizedBoxScreen100 extends StatelessWidget {
  const SizedBoxScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SizedBox")),
      // 예문
      //   - SizedBox, Text 사용 시
      // SizedBox
      //   - 자식 Widget이 없을 경우 남아 있는 공간을 모두 찾이 한다.
      //   - 크기를 지정하지 않을 경우 Child를 나타낼 수 있는 최소한의 layout을 가져간다.
      //   - Container 와 비교되는 Widget
      //   - 속성 : width, height, child
      //   - 사용이유 : 속성이 3개라서 Container보다 미비 하게나마 가볍다.
      //   -           SizedBox 사용했다고 하면 size만 필요해서 했다라는 script 해석이 좋음
      //   -           Widget과 Widget사이에 여백을 주고 싶을 때 사용
      // Widget과 Widget사이에 여백을 주고 싶을 때 사용 -> 에 대한 추가논의
      //   - Fluter의 기본 특성상, 어떠한 서식이든 wrapping하는 방식이 기본이다.
      //   - 그래서 Widget과 Widget사이에 여백이 필요한 Widget을 중간이 추가하는 방식을 사용하지 않고
      //     Wraaping하는 방식기 기본이다.
      //   - 그래서 SizedBox로 여백을 주기보단, Container를 Wrapping해서 Padding을 추가한다.
      body: SizedBox(
        child: Container(
          color: Colors.blue,
          child: const Text("SizedBox-Child영역만 찾이함"),
        ),
      ),
    );
  }
}
