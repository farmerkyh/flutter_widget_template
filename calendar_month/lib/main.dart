/*
  - Flutter : ver-3.3.7
*/
import 'package:calendar_month/heatmap_calender_100/heatmap_calender_090.dart';
import 'package:calendar_month/heatmap_calender_100/heatmap_calender_100.dart';
import 'package:calendar_month/heatmap_calender_100/heatmap_calender_110.dart';
import 'package:calendar_month/heatmap_calender_500/heatmap_calender_500.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //heatmap_calender_500.dart 소스에서만 필요 - start
  await Hive.initFlutter(); // initialize hive
  await Hive.openBox("Habit_Database"); // open a box
  //heatmap_calender_500.dart 소스에서만 필요 - end

  runApp(const MyApp());
}

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
        title: const Text("Module"),
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
            //ListView
            createLeftOneMenu(context, "Heatmap 1개월", HeatmapCalendar090()),
            createLeftOneMenu(context, "Heatmap 3개 월달력", const HeatmapCalendar100()),
            createLeftOneMenu(context, "Heatmap 월달력", const HeatmapCalendar110()),
            createLeftOneMenu(context, "fl_Heatmap", const HeatMapCalendar500()),

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
            //Navigator.pop(context);
            //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
            //Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
