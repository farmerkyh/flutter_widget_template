import 'package:flutter/material.dart';
import 'package:navigation/routes_step200_named/named_routes200.dart';
import 'package:navigation/routes_step200_named/named_routes200_first.dart';
import 'package:navigation/routes_step200_named/named_routes200_second.dart';
import 'package:navigation/routes_step200_named/named_routes200_third.dart';

class RouteName {
  static const home = "/";
  static const firstPage = "/firstPage";
  static const secondPage = "/secondPage";
  static const thirdPage = "/thirdPage";
}

class PageName {
  static const home = "홈";
  static const firstPage = "첫번째 페이지";
  static const secondPage = "두번째 페이지";
  static const thirdPage = "세번째 페이지";
}

var namedRoutes200 = <String, WidgetBuilder>{
  RouteName.home: (context) => const NamedRoutes200Home(),
  RouteName.firstPage: (context) => const NamedRoutes200First(),
  RouteName.secondPage: (context) => const NamedRoutes200Second(),
  RouteName.thirdPage: (context) => const NamedRoutes200Third(),
};
