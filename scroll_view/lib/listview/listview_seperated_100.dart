import "package:flutter/material.dart";

class ListViewSeperated100 extends StatelessWidget {
  final List<String> alphabet = <String>['A', 'B', 'C', 'D', 'E'];
  final List<double> listHeight = <double>[40, 45, 50, 155, 160];
  final List<int> color = <int>[600, 500, 400, 300, 200];

  ListViewSeperated100({super.key});

/*
  Desc : ListView.separated() Method이용하여 scroll + iten별 구분라인 추가
*/
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
            // Expanded
            //   - Header, Bottom 의 Text Height를 제외후 남은 영역을 모두 찾이 한다.
            //----------------------------------------------------------------------------------------------
            Expanded(
              //-------------------------------------------------------------------------
              // 1. ListView.separated
              //-------------------------------------------------------------------------
              child: ListView.separated(
                padding: const EdgeInsets.all(20.0),

                //-------------------------------------------------------------------------
                // 2. itemBuilder속성에 의해 for형식의 반복문이 itemCount 수 만큼 호출 된다.
                //-------------------------------------------------------------------------
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: listHeight[index], //List별 한줄 높이
                    //padding: const EdgeInsets.all(10),  //List 한줄에서 그 내부 내용과 한줄라인간의 간격
                    color: Colors.blue[color[index]],
                    child: Center(child: Text('Alaphbet = ${alphabet[index]}')),
                  );
                },

                //-------------------------------------------------------------------------
                // 3. separatorBuilder속성에 의해 item간에 Divider등 구분자를 구성할 수 있다.
                //      - itemBuilder가 한번 수행할 때 separatorBuilder callback도 한번 수행 된다.
                //-------------------------------------------------------------------------
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
