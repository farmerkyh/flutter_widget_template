import 'package:flutter/material.dart';
import 'package:navigation/navigation_100/navigation_100.dart';
import 'package:navigation/pop_100/pop_100.dart';
import 'package:navigation/routes_100/route_100.dart';
import 'package:navigation/routes_100/route_one_screen.dart';
import 'package:navigation/routes_100/route_three_screen.dart';
import 'package:navigation/routes_100/route_two_screen.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    //----------------------------------------------------------
    //1. Navigation Wiget으로 Route하기
    //----------------------------------------------------------
    //home: const NavigationScreen100(),

    //----------------------------------------------------------
    //2. namted route 방식
    ////   - routes  속성을 이용해 Route하기
    //----------------------------------------------------------
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => const RouteScreen100(),
    //   '/one': (context) => const RouteOneScreen(),
    //   '/two': (context) => const RouteTwoScreen(),
    //   '/three': (context) => const RouteThreeScreen(),
    // },

    //----------------------------------------------------------
    //3. Pop
    //----------------------------------------------------------
    home: const PopScreen100(),
  ));
}
