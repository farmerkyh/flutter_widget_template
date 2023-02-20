import 'package:flutter/material.dart';

import './slider/slider100.dart';
import './balloon_slider/balloon_slider100.dart';
import './slider_controller/slider_controller100.dart';
import './carousel_slider/carousel_slider100.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slider Template',
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
        title: const Text("Slider Template"),
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

            //BallonSlider
            createLeftOneMenu(context, "Ballon Slider", const BallonSlider100()),
            const Divider(height: 5),

            //
            createLeftOneMenu(context, "Carousel Slider", const CarouselSlider100()),
            const Divider(height: 5),

            //Slider
            createLeftOneMenu(context, "Slider", const Slider100()),
            const Divider(height: 5),

            //Slider
            createLeftOneMenu(context, "SlideSlider Controller1r", const SliderController100()),
            const Divider(height: 5),
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
