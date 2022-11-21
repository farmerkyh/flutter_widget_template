import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

class ClickableListWheelScrollView100 extends StatefulWidget {
  const ClickableListWheelScrollView100({super.key});

  @override
  State<ClickableListWheelScrollView100> createState() => _ClickableListWheelScrollView100State();
}

class _ClickableListWheelScrollView100State extends State<ClickableListWheelScrollView100> {
  final _scrollController = FixedExtentScrollController();
  final double _itemHeight = 100.0;
  final data = List.generate(20, (index) => 'Item $index');
  List monthsOfTheYear = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("ClickableListWheelScrollView"),
        centerTitle: true,
      ),
      body: SafeArea(
        //-------------------------------------------------------------------------
        // ClickableListWheelScrollView
        //  itemExtent - 하나의  List에 대한 height
        //  diameterRatio - 지름비율
        //                - 원통 지름과 주 축의 뷰포트 크기(화면에 보여주는 크기) 사이의 비율입니다.
        //                - 값이 1이면 원통의 지름이 뷰포트 크기와 동일함을 의미합니다.
        // offAxisFraction  - 휠이 수평으로 중앙에서 벗어난 정도 이다.
        //                  - 이로인 해 휠의 효과는 측면으로 구부러지는 효과를 나타낸다.
        //-------------------------------------------------------------------------
        child: ClickableListWheelScrollView(
          scrollController: _scrollController,
          itemHeight: _itemHeight,
          itemCount: data.length,
          onItemTapCallback: (index) {
            debugPrint("onItemTapCallback index: $index");
          },
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: _itemHeight,
            physics: FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            perspective: 0.002,
            onSelectedItemChanged: (index) {
              debugPrint("onSelectedItemChanged index: $index");
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) => ListTile(title: Text(data[index])),
              childCount: data.length,
            ),
          ),
        ),
      ),
    );
  }
}
