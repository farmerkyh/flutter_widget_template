import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorStep100());
}

// /*
//   @class
// */
// class NavigatorStep100 extends StatelessWidget {
//   static const String _title = 'Widget Example';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.blue,
//       ),
//       darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
//       home: NavigatorSetp100Home(),
//     );
//   }
// }

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class NavigatorStep100 extends StatelessWidget {
  const NavigatorStep100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('난 Home Page (Navigator step100)'),
            SizedBox(height: 30.0),
            BackButton(name: '<- 초기 화면으로 돌아가기'),
            SizedBox(height: 30.0),
            MoveButton(name: 'First Page로 이동 ->', page: FirstPage())
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
            MoveButton(name: 'Second Page로 이동 ->', page: SecondPage())
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
      body: Container(
        child: const Center(child: BackButton(name: '<- First page로 돌아가기')),
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
  final dynamic page;
  const MoveButton({required this.name, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigatorStep100()));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      child: Text(name),
    );
  }
}
