import 'package:flutter/material.dart';
import 'package:navigation/navigator_step200/navigator_step200_add.dart';
import 'package:navigation/navigator_step200/navigator_step200_todo.dart';

void main() {
  runApp(NavigatorStep200());
}

/*
  @class MaterialApp로 시작한다.
*/
class NavigatorStep200 extends StatelessWidget {
  static const String _title = 'Navigator Arguments';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      //home: SecondPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => NavigatorStep200Home(),
        '/todoPage': (context) => const NavigatorStep200Todo(),
        //'/addPage': (context) => const NavigatorStep200Add()
      },
    );
  }
}

//-----------------------------------------------------------------------
// 0. Home page
//-----------------------------------------------------------------------
class NavigatorStep200Home extends StatefulWidget {
  NavigatorStep200Home({super.key});

  @override
  State<NavigatorStep200Home> createState() => _NavigatorStep200HomeState();
}

class _NavigatorStep200HomeState extends State<NavigatorStep200Home> {
  List<Map<String, String>> todoList = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    todoList.add({"subject": "Fltter 공부하기", "flag": "NO"});
    todoList.add({"subject": "Dart 문법 익히기", "flag": "NO"});
    todoList.add({"subject": "Pattern 필수과목", "flag": "NO"});
    todoList.add({"subject": "때때로 나에게 휴식을", "flag": "NO"});
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TO DO List (Navigator Arguments)')),
        //-----------------------------------------------------------------------
        // 1. Todo list 조회
        //-----------------------------------------------------------------------
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    //InkWell
                    //  - 탭, 더블탭, 롱탭 등 다양한 터치 이벤트를 처리 할 수 있는 Widget이다.
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todoList[index]["subject"].toString(),
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            todoList[index]["flag"].toString(),
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                      onTap: () async {
                        var rtnValue = await Navigator.of(context).pushNamed('/todoPage', arguments: todoList[index]);
                        if (rtnValue != null && todoList[index]["flag"] != rtnValue) {
                          setState(() {
                            todoList[index]["flag"] = rtnValue.toString();
                          });
                        }
                      },
                    ),
                  );
                },
                itemCount: todoList.length,
              ),
            ),
            //-----------------------------------------------------------------------
            // 4. Todo 추가화면으로 이동
            //-----------------------------------------------------------------------
            ElevatedButton(
              onPressed: () async {
                //settings 속성을 이용한 argument전달 (현재 todo 갯수 넘기기)
                var subject = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => NavigatorStep200Add(),
                    settings: RouteSettings(arguments: todoList.length),
                  ),
                );
                if (subject != null && subject != '') {
                  setState(() {
                    todoList.add({"subject": subject.toString(), "flag": "NO"});
                  });
                }
              },
              child: const Text('TODO 추가하기'),
            )
          ],
        ));
  }
}
