import 'package:flutter/material.dart';
import 'layout/main_layout.dart';
import 'screen/custom_scroll_view_screen.dart';
import 'screen/grid_view_screen.dart';
import 'screen/list_view_screen.dart';
import 'screen/refresh_indicator.dart';
import 'screen/reorderable_list_view_screen.dart';
import 'screen/scrollbar_screen.dart';
import 'screen/single_child_scroll_view_screen.dart';

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
  ScreenModel(builder: (_) => SingleChildScrollViewScreen(), name: 'SingleChildScrollViewScreen'),
  ScreenModel(builder: (_) => ListViewScreen(), name: 'ListViewScreen'),
  ScreenModel(builder: (_) => GridViewScreen(), name: 'GridViewScreen'),
  ScreenModel(builder: (_) => ReorderableListViewScreen(), name: 'ReorderableListViewScreen'),
  ScreenModel(builder: (_) => CustomScrollViewScreen(), name: 'CustomScrollViewScreen'),
  ScreenModel(builder: (_) => ScrollbarScreen(), name: 'ScrollbarScreen'),
  ScreenModel(builder: (_) => RefreshIndicatorScreen(), name: 'RefreshIndicatorScreen'),
];
