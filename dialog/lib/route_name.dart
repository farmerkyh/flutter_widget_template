import 'package:dialog/alertdialog/alertdialog_100.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const alertdialog100 = '/AlertDialog100';
}

class PageName {
  static const alertdialog100 = 'AlertDialog (기초)';
}

var namedRoutes = <String, WidgetBuilder>{
  RouteName.alertdialog100: (context) => AlertDialog100(),
};
