import 'package:flutter/material.dart';

class ListWheelScrollView100 extends StatefulWidget {
  const ListWheelScrollView100({super.key});

  @override
  State<ListWheelScrollView100> createState() => _ListWheelScrollView100State();
}

class _ListWheelScrollView100State extends State<ListWheelScrollView100> {
  FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  List monthsOfTheYear = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
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
        //  itemExtent - 하나의  List에 대한 height
        //  diameterRatio - 지름비율
        //                - 원통 지름과 주 축의 뷰포트 크기(화면에 보여주는 크기) 사이의 비율입니다.
        //                - 값이 1이면 원통의 지름이 뷰포트 크기와 동일함을 의미합니다.
        // offAxisFraction  - 휠이 수평으로 중앙에서 벗어난 정도 이다.
        //                  - 이로인 해 휠의 효과는 측면으로 구부러지는 효과를 나타낸다.
        //-------------------------------------------------------------------------
        child: ListWheelScrollView(
          controller: fixedExtentScrollController,
          onSelectedItemChanged: (value) {
            debugPrint("value=$value");
          },
          //physics: const FixedExtentScrollPhysics(),
          itemExtent: 60.0,
          diameterRatio: 2,
          offAxisFraction: -1.5,

          children: monthsOfTheYear.map((month) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(month, style: const TextStyle(fontSize: 18.0))),
                  )),
                ],
              ),
            );
          }).toList(),
        ),
        //
        // ElevatedButton(
        //   onPressed: () {
        //     debugPrint("fixedExtentScrollController=${fixedExtentScrollController.selectedItem}");
        //   },
        //   child: const Text("값 확인"),
        // )
      ),
    );
  }
}
