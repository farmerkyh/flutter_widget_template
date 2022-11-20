import 'package:flutter/material.dart';

class ListWheelScrollView100 extends StatefulWidget {
  const ListWheelScrollView100({super.key});

  @override
  State<ListWheelScrollView100> createState() => _ListViewCustom100State();
}

class _ListViewCustom100State extends State<ListWheelScrollView100> {
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();
  List monthsOfTheYear = [
    '1s월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("ListWheelScrollView"),
        centerTitle: true,
      ),
      body: SafeArea(
        //-------------------------------------------------------------------------
        // ListWheelScrollView
        //  - 돋보기 같은 형태로 보여주는 Widget이다.
        //  - count 속성이 없는걸로 봐서 for형식이 아닌 children 속성에 Widget으로
        //    View를 하는 Widget이다.
        //-------------------------------------------------------------------------
        child: ListWheelScrollView(
          controller: fixedExtentScrollController,
          physics: const FixedExtentScrollPhysics(),
          itemExtent: 60.0,
          children: monthsOfTheYear.map((month) {
            return Card(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(month, style: const TextStyle(fontSize: 18.0)),
                )),
              ],
            ));
          }).toList(),
        ),
      ),
    );
  }
}
