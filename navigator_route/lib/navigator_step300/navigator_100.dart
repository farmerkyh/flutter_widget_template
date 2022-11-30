import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/navigator_step300/navigator_one_screen.dart';

class NavigationScreen100 extends StatelessWidget {
  const NavigationScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'NavigationScreen Home Screen', children: [
      ElevatedButton(
          onPressed: () async {
            // parameter값을 이용하여 argument전달
            final result = Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const NavigationOneScreen(
                  argument: 123,
                ),
              ),
            );
            debugPrint("navigation..Navigation_one_screen Result=${result}");
            //debugPrint(result);
          },
          child: Text('one screen으로 Push'))
    ]);
  }
}
