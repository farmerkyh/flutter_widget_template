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
      home: HeatmapCalendar090(),
    );
  }
}

class HeatmapCalendar090 extends StatefulWidget {
  HeatmapCalendar090({super.key});

  @override
  State<HeatmapCalendar090> createState() => _HeatmapCalendar090State();
}

class _HeatmapCalendar090State extends State<HeatmapCalendar090> {
  Map<DateTime, int> heatMapDatasets = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeatmapCalendar090')),
      backgroundColor: Colors.grey.withOpacity(0.9),
      body: HeatMap(
        // datasets: {
        //   DateTime(2023, 1, 6): 3,
        //   DateTime(2023, 1, 7): 7,
        //   DateTime(2023, 1, 8): 3,
        //   DateTime(2023, 1, 9): 13,
        //   DateTime(2023, 1, 13): 6,
        // },
        datasets: heatMapDatasets,
        startDate:
            DateTime.parse('${DateFormat('yyyyMM').format(DateTime.now())}01'),
        endDate: DateTime.parse(getDay2("last",
            ymd: DateFormat('yyyyMMdd').format(DateTime.now()).toString(),
            offSet: 0)),
        //colorMode: ColorMode.opacity,  //colorsets:{} Map에서 첫번째 값으로 달력color 처리
        //colorMode: ColorMode.color,    //colorsets:{} Map전체를 기준으로 달력color 처리
        colorMode: ColorMode.opacity,
        showText: false,
        scrollable: true,
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
          int seq = Random().nextInt(13);
          setState(() {
            heatMapDatasets[DateTime.parse(value.toString())] = seq;
          });

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
    ;
  }
}
