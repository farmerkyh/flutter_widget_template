import 'package:flutter/material.dart';
import 'package:row_column/column/column_screen_050.dart';
import 'package:row_column/column/column_screen_120.dart';
import 'package:row_column/container/container_screen_100.dart';
import 'package:row_column/container/container_screen_110.dart';
import 'package:row_column/expanded/expanded_screen_100.dart';
import 'package:row_column/overflow/column_listview_100.dart';
import 'package:row_column/overflow/container_listview_100.dart';
import 'package:row_column/overflow/scaffold_expanded_100.dart';
import 'package:row_column/overflow/scaffold_text_100.dart';
import 'package:row_column/overflow/sizedbox_listview_100.dart';
import 'package:row_column/row_column/row_screen_110.dart';
import 'package:row_column/sized_box/sized_box_100.dart';
import 'package:row_column/stack_positioned/stack_screen_100.dart';
import 'package:row_column/stack_positioned/stack_screen_110.dart';
import 'package:row_column/stack_positioned/stack_screen_120.dart';
import 'package:row_column/stack_positioned/stack_screen_130.dart';
import 'column/column_screen_100.dart';
import 'column/column_screen_110.dart';
import 'row_column/row_screen_100.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid Template',
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
        title: const Text("Column/Row Template"),
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
              accountEmail: Text("farmerkyh@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0))),
            ),

            //Column
            createLeftOneMenu(context, "Column(050)", const ColumnScreen050()),
            createLeftOneMenu(context, "Column(100)", const ColumnScreen100()),
            createLeftOneMenu(context, "Column + Row", const ColumnScreen110()),
            createLeftOneMenu(context, "Column + ListView", const ColumnScreen120()),

            const Divider(height: 5),

            //Row
            createLeftOneMenu(context, "Row", const RowScreen100()),
            createLeftOneMenu(context, "Row + Expanded", const RowScreen110()),
            const Divider(height: 5),

            //Container
            createLeftOneMenu(context, "Container(100)", const ContainerScreen100()),
            createLeftOneMenu(context, "Container(110)", const ContainerScreen110()),
            const Divider(height: 5),

            //Expanded
            createLeftOneMenu(context, "Expanded", const ExpandedScreen110()),
            const Divider(height: 5),
            //SizedBox
            createLeftOneMenu(context, "SizedBox", const SizedBoxScreen100()),
            const Divider(height: 5),
            //Stack
            createLeftOneMenu(context, "Stack", const StackScreen100()),
            createLeftOneMenu(context, "Stack+Positioned(error)", const StackScreen110()),
            createLeftOneMenu(context, "Stack+Positioned(120)", const StackScreen120()),
            createLeftOneMenu(context, "Stack+Positioned(130)", const StackScreen130()),

            //Overflow
            createLeftOneMenu(context, "Scaffold + Text", const ScaffoldText100()),
            createLeftOneMenu(context, "Column + ListView", const ColumnListView100()),
            createLeftOneMenu(context, "Container + ListView", const ContainerListView100()),
            createLeftOneMenu(context, "SizedBox + ListView", const SizedBoxListView100()),
            createLeftOneMenu(context, "Expanded", const ScaffoldExpanded100()),
          ],
        ),
      ),

      //-------------------------------------------------------
      //3. body
      //-------------------------------------------------------
      body: const Center(child: Text("Grid Template 모음집 \n메뉴를 클릭 하세요.")),
    );
  }

  //-------------------------------------------------------
  //@class 왼쪽 메뉴 라인 생성
  //-------------------------------------------------------
  SizedBox createLeftOneMenu(BuildContext context, String menuNm, Widget page) {
    return SizedBox(
      height: 30,
      child: ListTile(
        title: Text(menuNm),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          //Navigator.pop(context);
          //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
          //Navigator.pushReplacement(context, route);
        },
      ),
    );
  }
}
