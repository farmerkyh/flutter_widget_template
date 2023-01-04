import 'package:flutter/material.dart';
import 'package:onboard/onboarding_100.dart';

//플러터(flutter) 강의: 순한 맛 시즌 2-2 | 리스트뷰 빌더(Listview builder)와 다이어로그(Dialog) 팝업창 띄우기

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const OnBoardingPage()));
              },
              child: const Text('Go to onboarding screen'),
            )
          ],
        ),
      ),
    );
  }
}
