import 'package:flutter/material.dart';

/*
  Desc : Scaffold + Expanded Widget을 이용해서 구성
  수행결과 : 오류 
      The following assertion was thrown while looking for parent data.:
      Incorrect use of ParentDataWidget.

      The following ParentDataWidgets are providing parent data to the same RenderObject:
      - Expanded(flex: 1) (typically placed directly inside a Flex widget)
      - LayoutId-[<_ScaffoldSlot.body>](id: _ScaffoldSlot.body) 
        (typically placed directly inside a CustomMultiChildLayout widget)
      However, a RenderObject can only receive parent data from at most one ParentDataWidget.

      Usually, this indicates that at least one of the offending ParentDataWidgets listed above is 
      not placed directly inside a compatible ancestor widget.  
*/
class ScaffoldExpanded100 extends StatelessWidget {
  const ScaffoldExpanded100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expanded + ListView")),
      body: Expanded(
        child: Text('10000' * 1000),
      ),
    );
  }
}
