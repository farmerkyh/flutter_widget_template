import 'dart:math';

import 'package:calendar_month/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeatmapCalendar091(),
    );
  }
}

class HeatmapCalendar091 extends StatefulWidget {
  HeatmapCalendar091({super.key});

  @override
  State<HeatmapCalendar091> createState() => _HeatmapCalendar091State();
}

class _HeatmapCalendar091State extends State<HeatmapCalendar091> {
  Map<DateTime, int> heatMapDatasets = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HeatmapCalendar090')),
        backgroundColor: Colors.grey.withOpacity(0.9),
        body: HeatMapCalendar(
          defaultColor: Colors.white,
          flexible: true,
          colorMode: ColorMode.color,
          datasets: {
            DateTime(2021, 1, 6): 3,
            DateTime(2021, 1, 7): 7,
            DateTime(2021, 1, 8): 10,
            DateTime(2021, 1, 9): 13,
            DateTime(2021, 1, 13): 6,
          },
          colorsets: const {
            1: Colors.red,
            3: Colors.orange,
            5: Colors.yellow,
            7: Colors.green,
            9: Colors.blue,
            11: Colors.indigo,
            13: Colors.purple,
          },
          onClick: (value) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.toString())));
          },
        ));
  }
}
