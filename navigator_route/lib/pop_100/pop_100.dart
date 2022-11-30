import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PopScreen100()));
}

/*
  이 dart소스 main()을 실행시켜야 원하는 테스트를 할 수 있음
*/
class PopScreen100 extends StatefulWidget {
  const PopScreen100({super.key});

  @override
  State<PopScreen100> createState() => _PopScreen100State();
}

class _PopScreen100State extends State<PopScreen100> {
  @override
  Widget build(BuildContext context) {
    //---------------------------------------------------------------------------------
    // WillPopScope
    //  - android 하단 bar에서 뒤로 가기를 눌렀을 경우 앱의 Home화면이면 app이 닫혀 버린다.
    //  - 이 앱을 닫히지 않게 하고 싶을 경우 WillPopScope Widget을 사용한다.
    //  - false를 return하면 뒤로가기 기능이 무효화 된다.
    //  - async : 필수
    // Navigator.of(context).canPop()
    //  - Navigator stack에서 pop 가능여부 return한다.
    //  - true : stack에 pop할 페이지가 존재시
    //  - false : stack에 pop할 페이지가 미 존재 시
    //---------------------------------------------------------------------------------
    return WillPopScope(
      onWillPop: () async {
        var canPop = Navigator.of(context).canPop();
        debugPrint("onWillPop canPop = $canPop");
        return canPop;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Pop Home Screen')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, //Widget은 최대한 넓혀준다.
            children: [
              ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).canPop()
                  //   - 현재 화면에서 Pop을 할 수 있는 상태인지? 없는 상태인지 여부를 return
                  var canPop = Navigator.of(context).canPop();
                  debugPrint("ElevatedButton canPop flag = $canPop");
                },
                child: const Text('canPop'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).maybePop(123)
                  //   - 뒤로갈 수 있는 페이지가 없을 경우 이동하지 않는다.
                  Navigator.of(context).maybePop(123);
                },
                child: const Text('maybePop'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(123);
                },
                child: const Text('Pop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
