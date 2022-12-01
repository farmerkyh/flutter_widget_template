import 'package:flutter/material.dart';
import 'package:navigation/routes_step100/routes_step110_first.dart';
import 'package:navigation/routes_step100/routes_step110_second.dart';
import 'package:navigation/routes_step100/routes_step110_third.dart';

//메뉴를 구성할 모델
class RoutesStep110ScreenModel {
  final WidgetBuilder builder;
  final String name;

  RoutesStep110ScreenModel({
    required this.builder,
    required this.name,
  });
}

final routesStep100Screens = [
  RoutesStep110ScreenModel(builder: (_) => RoutesStep110First(), name: 'First Page'),
  RoutesStep110ScreenModel(builder: (_) => RoutesStep110Second(), name: 'Second Page'),
  RoutesStep110ScreenModel(builder: (_) => RoutesStep110Third(), name: 'Third Page'),
];
