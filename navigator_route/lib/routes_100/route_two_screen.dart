import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/routes_100/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context)
    //   - context Weget Tree에서 가장 가까운 ModalRoute를 가져오기
    //   - ModalRoute : full screen (RouteTwoScreen100를 말한다.)
    final argument = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route two',
      children: [
        Text('Route one 에서 받은값 = $argument', textAlign: TextAlign.center),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Pop')),
        //
        const SizedBox(height: 50),
        //
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/three', arguments: 'abcd');
            },
            child: const Text('Push Named')),
        //
        const SizedBox(height: 50),
        //
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed('/three', arguments: 'abcd');
            },
            child: const Text('pushReplacementNamed')),
        //
        const SizedBox(height: 50),
        //
        //pushAndRemoveUntil
        //(route) => false
        //  - 다음화면으로 같을 경우 Appbar에 뒤로가기 버튼이 없다.
        //  - 이유는 뒤로가는 route가 다 지워졌기 때문이다.
        //  - 그래서 RouteThreeScreen()화면에서 pop을 하면 검은화면이 뜬다.
        //(route) => true
        //  - 모든 route가 다 살아있다.
        //route.settings.name == '/'
        //  - 조건절의 결과가 truee이면 route정보를 살리고
        //  - 조건절의 결과가 false이면 route정보를 삭제한다.
        //  - 그래서, '/'(Route Home Screen화면)만 살아 있고, 다른 route정보는 삭제 된다.
        //  - RouteThreeScreen()화면에서 pop을 하면 Route Home Screen화면으로 바로 이동 된다.
        //수행과정
        //  - 버튼이 눌리고 -> Route정보를 유지할지, 삭제할지 처리 하기 위해서
        //   "(route)=> .." 이 문장을 반복 수행 한다.
        //   -> Routes정보가 삭제 또는 유지가 완료 된 후 -> 다음 화면으로 push한다.
        //   -> 다음화면으로 마지막에 stack에 push하기 때문에 삭제 되지 않고 유지 된다.
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const RouteThreeScreen(),
                  ),
                  (route) => route.settings.name == '/');
            },
            child: const Text('push And Remove Until')),

        //pushNamedAndRemoveUntil 를 이용한 Route 삭제 및 유지
        //  - 모든 내용은 위와 동일하다.
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/three', (route) => route.settings.name == '/');
            },
            child: const Text('pushNamedAndRemoveUntil')),
      ],
    );
  }
}
