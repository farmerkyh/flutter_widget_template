import 'package:flutter/material.dart';
import 'package:navigation/routes_step200_named/named_routes200_class.dart';

void main() {
  runApp(NamedRoutes200());
}

/*
  @class Named Routes(basic)
*/
class NamedRoutes200 extends StatelessWidget {
  static const String _title = 'Named Routes(class)';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      initialRoute: RouteName.home,
      routes: namedRoutes200,
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class NamedRoutes200Home extends StatelessWidget {
  const NamedRoutes200Home({super.key});

  @override
  Widget build(BuildContext context) {
    //namedRoutes200.entries;
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Routes Step100 (basis)"),
        centerTitle: true,
        //elevation: 0.0,

        actions: [
          IconButton(
              onPressed: () {
                debugPrint("click");
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),

      //-------------------------------------------------------
      //2. Drawer menu
      //-------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //-------------------------------------------------------
            //3. Drawer - Logo
            //-------------------------------------------------------
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/farmer_loop.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text("farmerkyh@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0))),
            ),
            for (var element in namedRoutes200.entries) _NamedDrawerMenu(name: element.key, builder: element.value)
          ],
        ),
      ),

      //-------------------------------------------------------
      //5. body
      //-------------------------------------------------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Named Routes class이용 \n메뉴를 클릭 하세요.")),
          _BackButton(
            name: '전체 Home으로 가기',
          )
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 10. 뒤로가기 버튼
//-----------------------------------------------------------------------
class _BackButton extends StatelessWidget {
  final String name;
  const _BackButton({required this.name, super.key});

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
// 1. First Page
//-----------------------------------------------------------------------
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: const Center(child: Text('난 First Page')),
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
      body: const Center(child: Text('난 Second Page')),
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
      appBar: AppBar(title: const Text('Third Page')),
      body: const Center(child: Text('난 Third Page')),
    );
  }
}

//-----------------------------------------------------------------------
// 11. Drawer menu 버튼 Widget
//-----------------------------------------------------------------------
class _NamedDrawerMenu extends StatelessWidget {
  final String name;
  final WidgetBuilder builder;

  const _NamedDrawerMenu({required this.name, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white, //기본 메뉴 tile배경색
      //selectedTileColor: Color(0xFF52C7B8), //선택이 된 상태에서 배경색
      //selectedColor: Colors.black, //선택이 된 상태에서 글자 색
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: builder));
      },
      title: Text(name),
    );
  }
}
