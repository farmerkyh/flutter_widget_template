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
  bool? canPopFlag;
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
              //---------------------------------------------------------------------------------
              const Text('  1. canPop : 현재 Pop가능 상태인지 여부를 return'),
              //---------------------------------------------------------------------------------
              ElevatedButton(
                onPressed: () {
                  var canPop = Navigator.of(context).canPop();
                  setState(() {
                    canPopFlag = canPop;
                  });
                },
                child: const Text('Navigator.of(context).canPop()'),
              ),
              Center(child: Text('현재 Pop가능 상태 = $canPopFlag')),
              const SizedBox(height: 30),

              //---------------------------------------------------------------------------------
              const Text('  2. maybePop : 현재 Pop가능한 상태인 경우에만 pop이 실행됨'),
              //---------------------------------------------------------------------------------
              ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).maybePop(123)
                  //   - 뒤로갈 수 있는 페이지가 없을 경우 이동하지 않는다.
                  Navigator.of(context).maybePop();
                },
                child: const Text('Navigator.of(context).maybePop()'),
              ),
              const SizedBox(height: 30),

              //---------------------------------------------------------------------------------
              const Text('  3. pop : pop가능 상태와 관계없이 수행'),
              //---------------------------------------------------------------------------------
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Navigator.of(context).pop()'),
              ),
              const SizedBox(height: 30),

              //---------------------------------------------------------------------------------
              const Center(child: Text('  push ')),
              //---------------------------------------------------------------------------------
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
                child: const Text('다음페이지 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 1. First Page
//-----------------------------------------------------------------------
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  bool? canPopFlag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('이전Page존재')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //---------------------------------------------------------------------------------
            const Text('  1. canPop : 현재 Pop가능 상태인지 여부를 return'),
            //---------------------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                var canPop = Navigator.of(context).canPop();
                setState(() {
                  canPopFlag = canPop;
                });
              },
              child: const Text('Navigator.of(context).canPop()'),
            ),
            Center(child: Text('현재 Pop가능 상태 = $canPopFlag')),
            const SizedBox(height: 30),

            //---------------------------------------------------------------------------------
            const Text('  2. maybePop : 현재 Pop가능한 상태인 경우에만 pop이 실행됨'),
            //---------------------------------------------------------------------------------
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).maybePop(123)
                //   - 뒤로갈 수 있는 페이지가 없을 경우 이동하지 않는다.
                Navigator.of(context).maybePop();
              },
              child: const Text('Navigator.of(context).maybePop()'),
            ),
            const SizedBox(height: 30),

            SizedBox(height: 30.0),
            _BackButton(name: '<- Home Page로 돌아가기'),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 10. 뒤로가기 버튼
//-----------------------------------------------------------------------
class _BackButton extends StatelessWidget {
  final String name;
  const _BackButton({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      onPressed: () {
        Navigator.of(context).pop(); // 현재 route를 스택에서 제거함
      },
      child: Text(name),
    );
  }
}
