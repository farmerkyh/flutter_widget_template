import 'package:flutter/material.dart';

class ListViewCustom100 extends StatefulWidget {
  const ListViewCustom100({super.key});

  @override
  State<ListViewCustom100> createState() => _ListViewCustom100State();
}

class _ListViewCustom100State extends State<ListViewCustom100> {
  List<String> items = <String>['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("ListView.custom"),
        centerTitle: true,
      ),
      body: SafeArea(
        //-------------------------------------------------------------------------
        // ListView.custom
        //   - custom () 생성자를 사용하면 목록의 자식이 빌드되는 방식에 대한 사용자 지정 기능을 사용하여
        //     ListView를 빌드 할 수 있다.
        //     이를 위해 필요한 주요 매개 변수는 항목을 빌드하는 SliverChildDelegate이다.
        // SliverChildDelegates의 유형
        //   - SliverChildListDelegate, SliverChildBuilderDelegate 2가지가 있다.
        //   - 자신의 델리게이트를 구축하기 위해이를 사용하거나 하위 클래스화할 수 있다.
        //     ListView.builder는 기본적으로 SliverChildBuilderDelegate가있는 ListView.custom이다.
        //     ListView 기본 생성자는 SliverChildListDelegate가있는 ListView.custom처럼 동작한다.
        //-------------------------------------------------------------------------
        child: ListView.custom(
          //-------------------------------------------------------------------------
          // 2. childrenDelegate
          //-------------------------------------------------------------------------
          childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // return Center(
                //   child: Container(
                //     child: Text(items[index]),
                //     height: 50,
                //     color: Colors.amber,
                //   ),
                // );
                debugPrint("index->$index");
                return Center(
                  child: KeepAlive(
                    data: items[index],
                    key: ValueKey<String>(items[index]),
                  ),
                );
              },
              childCount: items.length,

              //-------------------------------------------------------------------------
              // 2. childrenDelegate -> findChildIndexCallback
              //-------------------------------------------------------------------------
              findChildIndexCallback: (Key key) {
                final ValueKey<String> valueKey = key as ValueKey<String>;
                final String data = valueKey.value;
                debugPrint("data->$data");
                return items.indexOf(data);
              }),
        ),
      ),
      //-------------------------------------------------------------------------
      // 3. bottomNavigationBar
      //-------------------------------------------------------------------------
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => _reverse(),
              child: const Text('Reverse items(역순)'),
            ),
          ],
        ),
      ),
    );
  }

  void _reverse() {
    //setState : 이 api를 사용하려면 반드시 StatefulWidget을 상속받아야 된다
    setState(() {
      items = items.reversed.toList();
    });
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({required Key key, required this.data}) : super(key: key);
  final String data;
  @override
  State<KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(widget.data);
  }
}
