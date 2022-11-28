import 'package:flutter/material.dart';
import 'drawer_menu.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Drawer Pattern - 10"),
        centerTitle: true,
        //elevation: 0.0,

        actions: [
          IconButton(
            onPressed: () {
              debugPrint("click");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),

      //-------------------------------------------------------
      //2. menu
      //-------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.only(bottom: 20),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/farmer_loop.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text("aa@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0))),
            ),

            //class를 이용한 메뉴생성
            ...screens
                .map((screen) => _DrawerMenu(
                      menuBuilder: screen.builder,
                      menuNm: screen.name,
                    ))
                .toList()
            //Method를 이용한 메뉴 생성
            // ...screens
            //     .map((screen) => createLeftOneMenu(
            //           context,
            //           screen.builder,
            //           screen.name,
            //         ))
            //     .toList()
          ],
        ),
      ),
      body: const Center(child: Text('Drawer Pattern')),
    );
  }

  //-------------------------------------------------------
  //@class 왼쪽 메뉴 라인 생성
  //-------------------------------------------------------
  // Widget createLeftOneMenu(BuildContext context, WidgetBuilder builder, String menuNm) {
  //   return TextButton(
  //     style: const ButtonStyle(alignment: Alignment.centerLeft),
  //     onPressed: () {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: builder),
  //       );
  //     },
  //     child: Text(
  //       menuNm,
  //       style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
  //     ),
  //   );
  // }
}

class _DrawerMenu extends StatelessWidget {
  WidgetBuilder menuBuilder;
  String menuNm;

  _DrawerMenu({required this.menuBuilder, required this.menuNm, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(alignment: Alignment.centerLeft),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: menuBuilder),
        );
      },
      child: Text(
        menuNm,
        style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
