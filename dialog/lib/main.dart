import 'package:dialog/alertdialog/alertdialog_100.dart';
import 'package:dialog/route_name.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: namedRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Cupertino Template',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyGrid(),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Cupertino Template"),
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
            //Foundation
            LeftOneMenu(menuNm: "foundation-defaultTargetPlatform", namedRoutes: RouteName.alertdialog100),

            const Divider(height: 50),
          ],
        ),
      ),

      //-------------------------------------------------------
      //3. body
      //-------------------------------------------------------
      body: const Center(child: Text("Dialog Template 모음집 \n메뉴를 클릭 하세요.")),
    );
  }
}

/*
  @class 왼쪽 메뉴 라인 생성
*/
class LeftOneMenu extends StatelessWidget {
  String menuNm;
  var namedRoutes;
  LeftOneMenu({required this.menuNm, required this.namedRoutes, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ListTile(
          title: Text(menuNm),
          onTap: () {
            Navigator.pushNamed(context, namedRoutes);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => page));
            //Navigator.pop(context);
            //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
            //Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
