import 'package:flutter/material.dart';

/*
  Desc : 하나의 화면에 Text, Button, ListWheelScrollView() Widget 3가지 구현해보기
             - Scroll발생 시 선택된 item을 Text에 보여주기
             - 버튼을 클릭 하면 현재 선택된 item에 대해서 controller를 이용해서 값을 처리 하기
*/
class ListWheelScrollView110 extends StatefulWidget {
  const ListWheelScrollView110({super.key});

  @override
  State<ListWheelScrollView110> createState() => _ListWheelScrollView110State();
}

class _ListWheelScrollView110State extends State<ListWheelScrollView110> {
  FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
  final List _items = ['Dog', 'Cat', 'Dragon', 'Crocodile', 'KindaCode.com', 'Monkey', 'Chicken', 'Flamingo'];

  // The index of the selected item (the one at the middle of the wheel)
  // In the beginning, it's the index of the first item
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListWheelScrollView')),
      body: Column(children: [
        //-------------------------------------------------------------------------
        // 1. 화면 최상단에 scrollView에서 선택된 item 보여주기
        //-------------------------------------------------------------------------
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 50),
          color: Colors.grey.shade800,
          alignment: Alignment.center,
          child: Text(
            _items[_selectedItemIndex],
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),

        //-------------------------------------------------------------------------
        // 2. scrollView에서 선택된 item값을 controller를 통해 제어할 수 있다.
        //-------------------------------------------------------------------------
        Container(
          width: 250,
          height: 80,
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () {
                debugPrint('selectedItem-${fixedExtentScrollController.selectedItem}');
              },
              child: const Text('선택-후 화면닫기용 버튼')),
        ),

        //-------------------------------------------------------------------------
        // 2. ListWheelScrollView
        //-------------------------------------------------------------------------
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            color: Colors.amber.shade200,
            child: ListWheelScrollView(
              controller: fixedExtentScrollController,
              itemExtent: 100,
              diameterRatio: 1.8,

              //-------------------------------------------------------------------------
              // 3. onSelectedItemChanged
              //     - 사용자가 scroll도중 Widget중간에 위치하면 선택했다고 판단한다.
              //     - onTab에 대한 event는 아니다.
              //-------------------------------------------------------------------------
              onSelectedItemChanged: (int index) {
                // update the UI on selected item changes
                setState(() {
                  _selectedItemIndex = index;
                });
              },

              //-------------------------------------------------------------------------
              // 4. children
              //     - children하위의 Widget들로 List Wheel item을 구성 한다.
              //-------------------------------------------------------------------------
              children: _items
                  .map((e) => Card(
                        color: _items.indexOf(e) == _selectedItemIndex ? Colors.orange : Colors.indigo,
                        child: Center(
                          child: Text(e, style: const TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ]),
    );
  }
}


// class ListWheelScrollView110 extends StatefulWidget {
//   const ListWheelScrollView100({super.key});

//   @override
//   State<ListWheelScrollView110> createState() => _ListWheelScrollView110State();
// }

// class _ListWheelScrollView110State extends State<ListWheelScrollView100> {
//   FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();
//   List monthsOfTheYear = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //-------------------------------------------------------
//       //1. appbar
//       //-------------------------------------------------------
//       appBar: AppBar(
//         title: const Text("ListWheelScrollView"),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         //-------------------------------------------------------------------------
//         // ListWheelScrollView
//         //  itemExtent - 하나의  List에 대한 height
//         //  diameterRatio - 지름비율
//         //                - 원통 지름과 주 축의 뷰포트 크기(화면에 보여주는 크기) 사이의 비율입니다.
//         //                - 값이 1이면 원통의 지름이 뷰포트 크기와 동일함을 의미합니다.
//         // offAxisFraction  - 휠이 수평으로 중앙에서 벗어난 정도 이다.
//         //                  - 이로인 해 휠의 효과는 측면으로 구부러지는 효과를 나타낸다.
//         //-------------------------------------------------------------------------
//         child: ListWheelScrollView(
//           controller: fixedExtentScrollController,
//           onSelectedItemChanged: (value) {
//             debugPrint("value=$value");
//           },
//           //physics: const FixedExtentScrollPhysics(),
//           itemExtent: 60.0,
//           diameterRatio: 2,
//           offAxisFraction: -1.5,

//           children: monthsOfTheYear.map((month) {
//             return Card(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                       child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(child: Text(month, style: const TextStyle(fontSize: 18.0))),
//                   )),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//         //
//         // ElevatedButton(
//         //   onPressed: () {
//         //     debugPrint("fixedExtentScrollController=${fixedExtentScrollController.selectedItem}");
//         //   },
//         //   child: const Text("값 확인"),
//         // )
//       ),
//     );
//   }
// }
