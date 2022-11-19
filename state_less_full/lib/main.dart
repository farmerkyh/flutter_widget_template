import 'package:flutter/material.dart';
import './state_full/state_full_100.dart';

void main() {
  runApp(MaterialApp(
    home: Root(),
  ));
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Color color = Colors.blue;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  //show - true  상태이면 : Widget을 그리고, color를 넘겨준다.
                  //     - false 상태이면 : Widget을 삭제 하고, Container Widget을 생성한다.
                  child: show
                      ? StateFull100(
                          color: color,
                        )
                      : Container(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 색깔 변경 Button
                  //   - StateFull100 class는 StateFullWidget이므로 상태는 계속 남아 있다.
                  //     그래서 색깔이 변경된다고 해도 number값은 계속 유지 된다.
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.red ? Colors.blue : Colors.red;
                      });
                    },
                    child: Text(
                      '색깔 변경하기',
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  // 위젯 삭제/생서ㅓ Button
                  //   - 아무리 StateFullWidge이라도 삭제 된 후 재성 재생성된 Widget은
                  //     모든 값이 초기화 된다. 그래서 number값도 초기화 되어 0 부터 시작한다.
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Text(
                      !show ? '위젯 생성하기' : '위젯 삭제하기',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
