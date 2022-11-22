import 'package:flutter/material.dart';

/*
  Desc : Column + ListView.builder Widget을 이용해서 구성
*/
class ColumnScreen120 extends StatelessWidget {
  const ColumnScreen120({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column + ListView.builder")),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(color: Colors.red, width: 50.0, height: 50.0),
              Container(color: Colors.orange, width: 50.0, height: 50.0),
              Container(color: Colors.yellow, width: 50.0, height: 50.0),
              Container(color: Colors.grey, width: 50.0, height: 50.0),
              //
              Expanded(
                child: ListView.builder(
                  itemCount: 20, //grid에 표현할 item 개수

                  //-------------------------------------------------------------------------
                  // 2. itemBuilder속성에 의해 for형식의 반복문이 itemCount 수 만큼 호출 된다.
                  //-------------------------------------------------------------------------
                  itemBuilder: (BuildContext context, int index) {
                    debugPrint('index=$index');
                    //item 의 반목 항목 형성
                    return Container(
                      height: (index + 1) * 20,
                      color: Colors.amber[(index * 100)],
                      child: Text("GridView.builder.item=$index, amber[${index * 100}]"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
