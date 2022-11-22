import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/routes_100/route_one_screen.dart';

class RouteScreen100 extends StatelessWidget {
  const RouteScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    // WillPopScope
    //  - android 하단 bar에서 뒤로 가기를 눌렀을 경우 앱의 Home화면이면 app이 닫혀 버린다.
    //  - 이때, app에서 이 상태를 잡아 닫히게 할건지? 안할건지? 판단할 수 있는 Widget이다.
    //  - async : 필수
    return MainLayout(
      title: 'Route Home Screen',
      children: [
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () async {
              // parameter값을 이용하여 argument전달
              final result = Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => const RouteOneScreen(
                          argument: 123,
                        )),
              );
              debugPrint("Route..route_one_screen Result=${result}");
              //debugPrint(result);
            },
            child: const Text('one screen으로 Push'))
      ],
    );
  }
}
