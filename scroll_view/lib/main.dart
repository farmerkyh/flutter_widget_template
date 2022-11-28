/*
  - Flutter : ver-3.3.7
*/
import 'package:flutter/material.dart';
import 'package:grid_template/gridview/gridview_100.dart';
import 'package:grid_template/listview/listview_builder_110.dart';
import 'package:grid_template/customscrollview/custom_scrollview_100.dart';
import 'package:grid_template/listwheelscrollview/clickable_list_wheel_scroll_view_100.dart';
import 'package:grid_template/listwheelscrollview/list_wheel_scroll_view_100.dart';
import 'package:grid_template/listview/listview_100.dart';
import 'package:grid_template/listview/listview_seperated_100.dart';
import 'package:grid_template/listview/listview_builder_100.dart';
import 'package:grid_template/listview/listview_custom_100.dart';
import 'package:grid_template/gridview/gridview_builder_100.dart';
import 'package:grid_template/gridview/gridview_count_100.dart';
import 'package:grid_template/gridview/gridview_extent_100.dart';
import 'package:grid_template/gridview/gridview_custom_100.dart';
import 'package:grid_template/listwheelscrollview/list_wheel_scroll_view_105.dart';
import 'package:grid_template/listwheelscrollview/list_wheel_scroll_view_106.dart';
import 'package:grid_template/listwheelscrollview/list_wheel_scroll_view_110.dart';
import 'package:grid_template/pageview/page_view_100.dart';
import 'package:grid_template/refreshindicator/refreshindicator_100.dart';
import 'package:grid_template/scrollbar/scrollbar_100.dart';
import 'package:grid_template/singlechildscrollview/single_child_scroll_view_100.dart';
import 'package:grid_template/singlechildscrollview/single_child_scroll_view_110.dart';
import 'package:grid_template/singlechildscrollview/single_child_scroll_view_120.dart';

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
        title: const Text("Grid/List Template"),
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
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            //ListView
            createLeftOneMenu(context, "ListView", const ListView100()),
            createLeftOneMenu(
                context, "ListView.builder(기본)", const ListViewBuilder100()),
            createLeftOneMenu(
                context, "             .builder(구분라인)", ListViewBuilder110()),
            createLeftOneMenu(
                context, "             .separated", ListViewSeperated100()),
            createLeftOneMenu(context, "             .custtom(100)",
                const ListViewCustom100()),
            createLeftOneMenu(
                context, "CustomScrollView(여러게View)", CustomScrollView100()),
            const Divider(height: 5),
            //GridView
            createLeftOneMenu(context, "GridView", const GridView100()),
            createLeftOneMenu(
                context, "GridView.builder", const GridViewBuilder100()),
            createLeftOneMenu(
                context, "               .count", GridViewCount100()),
            createLeftOneMenu(
                context, "               .extent", GridViewExtent100()),
            createLeftOneMenu(
                context, "               .custom", const GridViewCustom100()),

            const Divider(height: 5),
            createLeftOneMenu(context, "ListWheelScrollView(100)",
                const ListWheelScrollView100()),
            createLeftOneMenu(
                context,
                "                                -onTap(105)",
                const ListWheelScrollView105()),
            createLeftOneMenu(
                context,
                "                                -onTap(106)",
                const ListWheelScrollView106()),
            createLeftOneMenu(
                context,
                "                                -button(110)",
                const ListWheelScrollView110()),
            createLeftOneMenu(context, "ClickableListWheelScrollView",
                const ClickableListWheelScrollView100()),

            const Divider(height: 5),
            createLeftOneMenu(context, "SingleChildScrollView(100)",
                const SingleChildScrollView100()),
            createLeftOneMenu(context, "SingleChildScrollView(110)",
                const SingleChildScrollView110()),
            createLeftOneMenu(context, "SingleChildScrollView(120)",
                const SingleChildScrollView120()),

            const Divider(height: 5),
            createLeftOneMenu(context, "PageView", const PageViewScreen100()),
            createLeftOneMenu(context, "Scrollbar", Scrollbar100()),
            createLeftOneMenu(
                context, "RefreshIndicator", RefreshIndicator100()),

            const Divider(height: 5),

            const Divider(height: 50),
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
  Widget createLeftOneMenu(BuildContext context, String menuNm, Widget page) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ListTile(
          title: Text(menuNm),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
            //Navigator.pop(context);
            //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
            //Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
