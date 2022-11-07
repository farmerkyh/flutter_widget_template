import "package:flutter/material.dart";

class ListViewStep10 extends StatelessWidget {
  final List<String> alphabet = <String>['A', 'B', 'C', 'D', 'E'];
  final List<double> listHeight = <double>[40, 45, 50, 155, 160];
  final List<int> color = <int>[600, 500, 400, 300, 200];

  ListViewStep10({super.key});

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
              //   flex: 9,
              child: ListView.separated(
                padding: const EdgeInsets.all(20.0),

                //----------------------------------------------------------------------------------------------
                // 2. itemBuilder
                //   - itemCount 갯수만큼 수행하여 List를 생성한다.
                //----------------------------------------------------------------------------------------------
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: listHeight[index], //List별 한줄 높이
                    //padding: const EdgeInsets.all(10),  //List 한줄에서 그 내부 내용과 한줄라인간의 간격
                    color: Colors.blue[color[index]],
                    child: Center(child: Text('Alaphbet = ${alphabet[index]}')),
                  );
                },

                //----------------------------------------------------------------------------------------------
                // 3. separatorBuilder
                //   - List line별 줄 간격 및 구분Line의 두깨 설정
                //----------------------------------------------------------------------------------------------
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  thickness: 8,
                  height: 50,
                ),
                //
                itemCount: alphabet.length,
              ),
            ),
            const Text('Bottom'),
            // Expanded(
            //   flex: 1,
            //   child: ListView(
            //     children: const [Center(child: Text("하단"))],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
