import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

//교육영상 : https://www.youtube.com/watch?v=2VKpq4h3Sdw
//Github  : https://github.com/mitchkoko/HabitTrackerFlutter/tree/main/lib

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");

  runApp(const HeatMapCalendar500());
}

class HeatMapCalendar500 extends StatelessWidget {
  const HeatMapCalendar500({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
