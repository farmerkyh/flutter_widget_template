import 'package:flutter/material.dart';

class ListWheelScrollView105 extends StatefulWidget {
  const ListWheelScrollView105({super.key});

  @override
  State<ListWheelScrollView105> createState() => _ListWheelScrollView105State();
}

/*
  ListWheelScrollView
  1. child 로 GestureDetector()  widget을 적용했지만 작동 안됨
  2. stackoverflow에서 이 문제에 대한 많은 문의가 있지만 해결 불가
*/
class _ListWheelScrollView105State extends State<ListWheelScrollView105> {
  FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  List monthsOfTheYear = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListWheelScrollView-onTab')),
      body: ListWheelScrollView(
        controller: fixedExtentScrollController,
        physics: const FixedExtentScrollPhysics(),
        itemExtent: 110,
        children: ['A', 'B', 'C', 'D', 'E', 'F', 'G']
            .map(
              (letter) => Container(
                margin: const EdgeInsets.all(10),
                height: 90,
                color: Colors.yellow,
                child: GestureDetector(
                  onTap: () => print('Letter "$letter" is pressed.'),
                  child: Center(
                    child: Text(
                      letter,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
