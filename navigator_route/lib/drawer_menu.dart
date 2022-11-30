import 'package:flutter/material.dart';
import 'package:navigation/navigator_step100/navigator_step100.dart';
import 'package:navigation/navigator_step100/navigator_step110_routes.dart';
import 'package:navigation/navigator_step200/navigator_step200_arguments.dart';
import 'package:navigation/pop_100/pop_100.dart';

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
  ScreenModel(builder: (_) => NavigatorStep100(), name: 'Navigator-Step100(base)'),
  ScreenModel(builder: (_) => NavigatorStep110Routes(), name: 'Navigator-Step110(routes)'),
  ScreenModel(builder: (_) => NavigatorStep200(), name: 'Navigator-Step200(arguments)'),
  ScreenModel(builder: (_) => PopScreen100(), name: 'Pop'),
];
