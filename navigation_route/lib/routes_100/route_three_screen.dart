import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(
      title: 'Route three',
      children: [
        Text('Route two 에서 받은값 = $arguments', textAlign: TextAlign.center),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('pop'))
      ],
    );
  }
}
