import 'package:flutter/material.dart';

class ListViewCustom100 extends StatefulWidget {
  const ListViewCustom100({super.key});

  @override
  State<ListViewCustom100> createState() => _ListViewCustom100State();
}

/*
  Desc : ListView.custom() Method이용하여 scroll 이용해서 개발
         - 하단에 역순버튼을 추가해서 list를 역순으로 출력 되도록 한다.
*/
class _ListViewCustom100State extends State<ListViewCustom100> {
  List<String> items = <String>['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView.custom"),
        centerTitle: true,
      ),
      body: SafeArea(
        //-------------------------------------------------------------------------
        // 1. ListView.custom
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

class _KeepAliveState extends State<KeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(widget.data);
  }
}
