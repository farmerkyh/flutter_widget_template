import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/navigator_step300/navigator_three_screen.dart';

class NavigationTwoScreen100 extends StatelessWidget {
  const NavigationTwoScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context)
    //   - context Weget Tree에서 가장 가까운 ModalRoute를 가져오기
    //   - ModalRoute : full screen (NavigationTwoScreen100를 말한다.)
    final argument = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Navigation two',
      children: [
        Text('Navigation one 에서 받은값 -$argument', textAlign: TextAlign.center),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Pop')),
        const SizedBox(height: 50),
        //push 를 활용한 화면 호출
        ElevatedButton(
          onPressed: () {
            //settings 속성을 이용한 argument전달
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NavigationThreeScreen(),
                settings: const RouteSettings(arguments: 789),
              ),
            );
          },
          child: const Text('Push'),
        ),
        const SizedBox(height: 50),
        //pushReplacement 를 활용한 화면 호출
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => const NavigationThreeScreen()));
            },
            child: const Text('pushReplacement')),
      ],
    );
  }
}
