import "package:flutter/material.dart";

class ListViewSeperated100 extends StatelessWidget {
  final List<String> alphabet = <String>['A', 'B', 'C', 'D', 'E'];
  final List<double> listHeight = <double>[40, 45, 50, 155, 160];
  final List<int> color = <int>[600, 500, 400, 300, 200];

  ListViewSeperated100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview.seperated'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Header'),
            //----------------------------------------------------------------------------------------------
            // 1. Expanded
            //   - Header, Bottom 의 Text Height를 제외후 남은 영역을 모두 찾이 한다.
            //----------------------------------------------------------------------------------------------
            Expanded(
              //-------------------------------------------------------------------------
              // ListView.separated
              //   - ListView.builder Widget성격에 separatorBuilder 속성이 추가된 Widget이다.
              //   - 한번 반복수행 시 itemBuilder, separatorBuilder 2개의 callback함수가 수행 된다.
              // separatorBuilder
              //   - List별 중간에 Line등의 Widget을 주로 넣는다.
              // 참고
              //   - Flutter 과거버전 ListView.separated가 없을 때는 ListView.builder를 이용해서 구분라인 추가 했었음
              //   - itemCount = List 갯수 * 2만 큼 수행시키고, 홀수는 List값, 짝수는 구분라인을 만들었음
              //-------------------------------------------------------------------------
              child: ListView.separated(
                padding: const EdgeInsets.all(20.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: listHeight[index], //List별 한줄 높이
                    //padding: const EdgeInsets.all(10),  //List 한줄에서 그 내부 내용과 한줄라인간의 간격
                    color: Colors.blue[color[index]],
                    child: Center(child: Text('Alaphbet = ${alphabet[index]}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  thickness: 8,
                  height: 50,
                ),
                itemCount: alphabet.length,
              ),
            ),
            const Text('Bottom'),
          ],
        ),
      ),
    );
  }
}
