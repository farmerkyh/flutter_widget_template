import 'package:flutter/material.dart';
import 'package:navigation/routes_step100/routes_step110_model.dart';

void main() {
  runApp(RoutesStep110());
}

/*
  @class
*/
class RoutesStep110 extends StatelessWidget {
  static const String _title = 'Routes Templete';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.amber),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: RoutesStep110Home(),
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class RoutesStep110Home extends StatelessWidget {
  const RoutesStep110Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Routes Step110 (model)"),
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

            //-------------------------------------------------------
            //4. Drawer - Menu
            //-------------------------------------------------------
            ...routesStep100Screens.map((screen) => _DrawerMenu(name: screen.name, builder: screen.builder)),
          ],
        ),
      ),

      //-------------------------------------------------------
      //5. body
      //-------------------------------------------------------
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text("Routes 기본방식 + Menu목록을 ClassModel 이용 Template \n메뉴를 클릭 하세요.")),
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
// 11. Drawer menu 버튼 Widget
//-----------------------------------------------------------------------
class _DrawerMenu extends StatelessWidget {
  final String name;
  final WidgetBuilder builder;

  const _DrawerMenu({required this.name, required this.builder, super.key});

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
