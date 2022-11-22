import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

class ClickableListWheelScrollView100 extends StatefulWidget {
  const ClickableListWheelScrollView100({super.key});

  @override
  State<ClickableListWheelScrollView100> createState() => _ClickableListWheelScrollView100State();
}

/*
  Desc : ClickableListWheelScrollView() Widget을 이용해서 ListWheelScrollView Widget에 onTab 기능 추가하기
*/
class _ClickableListWheelScrollView100State extends State<ClickableListWheelScrollView100> {
  final _scrollController = FixedExtentScrollController();
  final double _itemHeight = 100.0;
  final data = List.generate(20, (index) => 'Item - $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClickableListWheelScrollView"),
        centerTitle: true,
      ),
      body: SafeArea(
        //-------------------------------------------------------------------------
        // 1. ClickableListWheelScrollView
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

          //-------------------------------------------------------------------------
          // 2. onItemTapCallback은 ListWheelScrollView Widget에서 특정 item을 클릭 시
          //     클릭한 item에 대한 callback Event이다.
          //-------------------------------------------------------------------------
          onItemTapCallback: (index) {
            debugPrint("onItemTapCallback index: $index");
          },

          //-------------------------------------------------------------------------
          // 3. ListWheelScrollView.useDelegate method를 이용해서 바퀴형태의 scroll 기능을 구현한다.
          //-------------------------------------------------------------------------
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: _itemHeight,
            physics: FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            perspective: 0.002,

            //-------------------------------------------------------------------------
            // 4. onSelectedItemChanged
            //     - 사용자가 scroll도중 Widget중간에 위치하면 선택했다고 판단한다.
            //     - onTab에 대한 event는 아니다.
            //-------------------------------------------------------------------------
            onSelectedItemChanged: (index) {
              debugPrint("onSelectedItemChanged index: $index");
            },

            //-------------------------------------------------------------------------
            // 4. childDelegate
            //     - ListWheelChildBuilderDelegate Widget을 이용해서 scroll item을 생성한다.
            //-------------------------------------------------------------------------
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
