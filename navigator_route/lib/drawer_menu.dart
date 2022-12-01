import 'package:flutter/material.dart';
import 'package:navigation/navigator_step100/navigator_step100.dart';
import 'package:navigation/navigator_step100/navigator_step110_routes.dart';
import 'package:navigation/navigator_step200/navigator_step200_arguments.dart';
import 'package:navigation/pop_100/pop_100.dart';
import 'package:navigation/routes_step100/routes_step100.dart';
import 'package:navigation/routes_step100/routes_step110.dart';
import 'package:navigation/routes_step200_named/named_routes200.dart';

//메뉴를 구성할 모델
class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

final screens = [
  ScreenModel(builder: (_) => NavigatorStep100(), name: 'Navigator-Step100(basis)'),
  ScreenModel(builder: (_) => NavigatorStep110Routes(), name: '                -Step110(routes)'),
  ScreenModel(builder: (_) => NavigatorStep200(), name: '                -Step200(arguments)'),
  ScreenModel(builder: (_) => NavigatorStep200(), name: '                -Step200(arguments)'),
  ScreenModel(builder: (_) => PopScreen100(), name: 'Pop'),
  ScreenModel(builder: (_) => RoutesStep100(), name: 'Routes-Step100(basis)'),
  ScreenModel(builder: (_) => RoutesStep110(), name: '            -Step110(model)'),
  ScreenModel(builder: (_) => NamedRoutes200(), name: 'Named Routes-Step200(class)'),
];
