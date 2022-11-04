//----------------------------------------------------------------------------------------------
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

       //----------------------------------------------------------------------------------------------
       //1. ListView
       //   - .separated       . 라인별 구분라인이 그린다.
       //   - separatorBuilder . 구분라인을 그릴때 option
       //                      . Divider(thickness):구분라인이 두꺼워진다고 해서 자동으로 구분간격도 늘어나지는 않는다.
       //                      . Divider(height)   : List 라인별 사이의 간격
       //   - itemCount . 해당 숫만큼 itemBuilder 를 수행 한다.
       //   - padding   . ListView와 item list 사이의 간격
       //2. Expanded
       //   - 남은 간격을 n분의1로 크기 설정
       //   - flex : Expanded 가 여러 개 일 경우 각각의 height 비율을 지정할 수 있다.
       //----------------------------------------------------------------------------------------------
       body: Container(
         child: Column(
           children: [
             const Text('주제명'),
             Expanded(
               flex: 9,
               child: ListView.separated(
                 padding: const EdgeInsets.all(20.0),
                 //
                 itemBuilder: (BuildContext context, int index) {
                   return Container(
                     height: listHeight[index], //List한줄 높이 (사실 Container 높이 이다.)
                     //padding: const EdgeInsets.all(10),  //List 한줄에서 그 내부 내용과 한줄라인간의 간격
                     color: Colors.blue[color[index]],
                     child: Center(child: Text('Alaphbet = ${alphabet[index]}')),
                   );
                 },
                 //
                 separatorBuilder: (BuildContext context, int index) => const Divider(
                   thickness: 8,
                   height: 50,
                 ),
                 //
                 itemCount: 5, //alphabet.length,
               ),
             ),
             Expanded(
               flex: 1,
               child: ListView(
                 children: [Center(child: Text("하단"))],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
//----------------------------------------------------------------------------------------------