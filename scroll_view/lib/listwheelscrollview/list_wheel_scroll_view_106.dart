import 'package:flutter/material.dart';

/*
  Desc : ListWheelScrollView() Widget을 이용해서 바퀴형태의 ListScroll 구현하기 + onTab
          - ListWheelScrollView외부에서 GestureDetector()로 감싸기 
          - (즉, GestureDetector() 내부 child로 ListWheelScrollView 를 정의한다.)
          - 완벽하지는 않지만 onTab 기능은 작동함
          - 이때 onTab은 각 Item에 디한 onTab이 아니고, ListWheelScrollView Widget에 대한 onTab 이다.
*/
class ListWheelScrollView106 extends StatefulWidget {
  const ListWheelScrollView106({super.key});

  @override
  State<ListWheelScrollView106> createState() => _ListWheelScrollView106State();
}

/*
  ListWheelScrollView
  1. child 로 GestureDetector()  widget을 적용했지만 작동 안됨
  2. stackoverflow에서 이 문제에 대한 많은 문의가 있지만 해결 불가
  3. GestureDetector()안에 ListWheelScrollView Widget을 감싼 후 완벽하지는 않지만 onTab기능 일부 해결
*/
class _ListWheelScrollView106State extends State<ListWheelScrollView106> {
  int? _vIndiceWheel;
  FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  List monthsOfTheYear = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListWheelScrollView-onTab')),
      //-------------------------------------------------------------------------
      // 1. GestureDetector
      //     - ListWheelScrollView에 onTab Evetn 기능을 구현하기 위해서
      //       GestureDetector Widget의 child로 ListWheelScrollView Widget을 포함시킨다.
      //     - 이때 onTab은 각 Item에 디한 onTab이 아니고, ListWheelScrollView Widget에 대한 onTab 이다.
      //-------------------------------------------------------------------------
      body: GestureDetector(
        onTap: () {
          _vIndiceWheel ??= 0;
          debugPrint("ListWheelScrollView-GestureDetector-index=$_vIndiceWheel");
        },
        //-------------------------------------------------------------------------
        // 2. ListWheelScrollView
        //-------------------------------------------------------------------------
        child: ListWheelScrollView(
          controller: fixedExtentScrollController,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (value) {
            setState(() {
              _vIndiceWheel = value;
            });
          },
          itemExtent: 110,

          //-------------------------------------------------------------------------
          // 3. children
          //     - children하위의 Widget들로 List Wheel item을 구성 한다.
          //-------------------------------------------------------------------------
          children: monthsOfTheYear
              .map(
                (letter) => Container(
                  margin: const EdgeInsets.all(10),
                  height: 90,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(letter, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
