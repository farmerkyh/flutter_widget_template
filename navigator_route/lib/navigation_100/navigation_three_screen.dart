import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class NavigationThreeScreen extends StatelessWidget {
  const NavigationThreeScreen({super.key});

//아직 NavigationThreeScreen 까지는 연동해서 개발하지 않았음
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route three',
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('pop'))
      ],
    );
  }
}
