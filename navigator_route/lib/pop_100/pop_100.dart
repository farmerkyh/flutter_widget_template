import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/routes_100/route_one_screen.dart';

class PopScreen100 extends StatelessWidget {
  const PopScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    // WillPopScope
    //  - android 하단 bar에서 뒤로 가기를 눌렀을 경우 앱의 Home화면이면 app이 닫혀 버린다.
    //  - 이때, app에서 이 상태를 잡아 닫히게 할건지? 안할건지? 판단할 수 있는 Widget이다.
    //  - async : 필수
    return WillPopScope(
      onWillPop: () async {
        // true - pop 가능
        // false - pop 불가능
        var canPop = Navigator.of(context).canPop();
        return canPop;
      },
      child: MainLayout(
        title: 'Pop Home Screen',
        children: [
          ElevatedButton(
            onPressed: () {
              //Navigator.of(context).canPop()
              //   - 현재 화면에서 Pop을 할 수 있는 상태인지? 없는 상태인지 여부를 return
              var canPop = Navigator.of(context).canPop();
              debugPrint("canPop = $canPop");
            },
            child: const Text('canPop'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              //Navigator.of(context).maybePop(123)
              //   - 뒤로갈 수 있는 페이지가 없을 경우 이동하지 않는다.
              Navigator.of(context).maybePop(123);
            },
            child: const Text('maybePop'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(123);
            },
            child: const Text('Pop'),
          ),
        ],
      ),
    );
  }
}
