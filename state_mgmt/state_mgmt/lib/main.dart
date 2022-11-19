/*
  - Flutter : ver-3.3.7
  - 아직 개발하지 않았음 -> 아래 url들을 보고 향후 개발 필요
    https://software-creator.tistory.com/26
*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Template',
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
        title: const Text("State Management Template"),
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
          padding: EdgeInsets.zero,
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
            //
            // createLeftOneMenu(context, "ListView.builder", const ListViewBuilder100()),
            // createLeftOneMenu(context, "             .separated", ListViewSeperated100()),
            // createLeftOneMenu(context, "             .custtom", const ListViewCustom100()),
            // createLeftOneMenu(context, "GridView.builder", const GridViewBuilder100()),
            // createLeftOneMenu(context, "               .count", GridViewCount100()),
            // createLeftOneMenu(context, "               .extent", GridViewExtent100()),
            // createLeftOneMenu(context, "               .custom", GridViewCustom100()),
          ],
        ),
      ),

      //-------------------------------------------------------
      //3. body
      //-------------------------------------------------------
      body: const Center(child: Text("상태관리 Template 모음집 \n메뉴를 클릭 하세요.")),
    );
  }

  //-------------------------------------------------------
  //@class 왼쪽 메뉴 라인 생성
  //-------------------------------------------------------
  ListTile createLeftOneMenu(BuildContext context, String menuNm, Widget page) {
    return ListTile(
      title: Text(menuNm),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        //Navigator.pop(context);
        //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
        //Navigator.pushReplacement(context, route);
      },
    );
  }
}
