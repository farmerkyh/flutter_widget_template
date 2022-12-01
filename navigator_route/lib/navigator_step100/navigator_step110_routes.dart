import 'package:flutter/material.dart';

void main() {
  runApp(NavigatorStep110Routes());
}

/*
  @class MaterialApp 으로 정의했음.
*/
class NavigatorStep110Routes extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      //home: SecondPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const NavigatorSetp110Home(),
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdPage()
      },
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class NavigatorSetp110Home extends StatelessWidget {
  const NavigatorSetp110Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('난 Home Page (Navigator step110)'),
            SizedBox(height: 30.0),
            Text('MaterialApp으로 시작했기 때문에 AppBar에 뒤로가기 버튼이 생성안됨'),
            SizedBox(height: 30.0),
            BackButton(name: '<- 초기 화면으로 돌아가기 (error)'),
            SizedBox(height: 30.0),
            MoveButton(name: 'First Page로 이동 ->', route_name: '/first')
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 1. First Page
//-----------------------------------------------------------------------
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('난 First Page'),
            SizedBox(height: 30.0),
            BackButton(name: '<- Home Page로 돌아가기'),
            SizedBox(height: 30.0),
            MoveButton(name: 'Second Page로 이동 ->', route_name: '/second')
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 2. Second Page
//-----------------------------------------------------------------------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('난 Second Page'),
            SizedBox(height: 30.0),
            BackButton(name: '<- First page로 돌아가기'),
            SizedBox(height: 30.0),
            MoveButton(name: 'Third Page로 이동 ->', route_name: '/third')
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 3. Third Page
//-----------------------------------------------------------------------
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // 현재 route를 스택에서 제거함
              Navigator.of(context).pop();
            },
            child: Text('돌아가기'),
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 10. 뒤로가기 버튼
//-----------------------------------------------------------------------
class BackButton extends StatelessWidget {
  final String name;
  const BackButton({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(); // 현재 route를 스택에서 제거함
      },
      child: Text(name),
    );
  }
}

//-----------------------------------------------------------------------
// 11. 다음페이지로 이동 버튼
//-----------------------------------------------------------------------
class MoveButton extends StatelessWidget {
  final String name;
  final String route_name;
  const MoveButton({required this.name, required this.route_name, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigatorStep110()));
        Navigator.of(context).pushNamed(route_name);
      },
      child: Text(name),
    );
  }
}
