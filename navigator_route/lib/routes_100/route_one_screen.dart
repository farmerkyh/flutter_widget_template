import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/routes_100/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? argument;
  const RouteOneScreen({this.argument, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route one',
      children: [
        //Text
        //  - MainLayout class안에 MainAxisAlignment.center,CrossAxisAlignment.stretch 를 했기 때문에
        //    Text widget자체는 center정렬과 strech가 된 상태이다.
        //    하지만 Text내부의 값은 Text Widget특성상 default값이 왼쪽 정렬되어 있다.
        //  - 그래서 TextAlign.center 로 문자열을 중앙 정렬시키는 것이다.
        Text('navigation에서 받은값 = $argument', textAlign: TextAlign.center),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(456);
            },
            child: const Text('pop')),

        const SizedBox(height: 50),

        ElevatedButton(
            onPressed: () {
              //settings 속성을 이용한 argument전달
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const RouteTwoScreen(),
                  settings: const RouteSettings(arguments: 7890),
                ),
              );
            },
            child: const Text('two screen으로 Push')),
      ],
    );
  }
}
