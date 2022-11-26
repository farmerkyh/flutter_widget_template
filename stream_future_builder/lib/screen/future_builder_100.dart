import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilder100 extends StatefulWidget {
  const FutureBuilder100({Key? key}) : super(key: key);

  @override
  _FutureBuilder100State createState() => _FutureBuilder100State();
}

class _FutureBuilder100State extends State<FutureBuilder100> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      appBar: AppBar(title: Text('FutureBuilder')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //FutureBuilder.future 정의
        // - Future를 Return해주는 어떠한 함수든 다 넣을 수 있다.
        // - 이 함수의 상태가 변경 될 때마다 FutureBuilder.builder를 다시 실행하게 하여
        //   화면을 다시 그려질 수있도록 한다.
        // - 변경이란 : future에 적용된 메서드가
        //             Loading중이거나, 끝났거나, 또는 어떤 값이 Return되었거나, error가 났거나
        //             이런 상태가 변경 되면 받게 된다.
        // - build()method는 다시 실행하지 않고, builder:의 callback만 다시 실행해준다.
        //FutureBuilder.builder 실행 시점
        // 1. 초기 build()시점
        // 2. future: 속성에 적용된 메서드의 return값이 변경 된 경우
        // 3. setState()에 의해서 재 build() 되는 시점
        // * 특이점
        //   재 build()가 되면 class Member변수의 값을 제외하곤 모두다 초기화가 된다.
        //   하지만  setState()에 의해서 재 build()가 될 때
        //   FutureBuilder안에 있던 snapshot의 값은 유지가 된다. (****)
        //FutureBuilder > builder > snapshot
        // - 이 snapshot 속성으로 변경된 값을 받아서 사용할 수 있다.
        //FutureBuilder Generic
        // - FutureBuilder Generic이 존재 한다.
        // - FutureBuilder<Object> 과 같은 형식이다.
        // - 이 때 <Object>와 같으 Generic은 future:속성의 return type이다.
        //   즉, 아래에서는 checkPermission() 메서드의 return type이다.
        //   snapshot.data의 type이다.
        // - Generic은 생략해도 알아서 인지해서 적용 된다.
        child: FutureBuilder<int>(
          future: getNumber(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              //데이터가 있을때 위젯 렌더링
            } else if (snapshot.hasError) {
              //데이터가 있을때 위젯 렌더링
            } else {
              //로딩중일때 위젯 렌더링
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
                Text('ConState : ${snapshot.connectionState}',
                    style: textStyle),
                Text('Data : ${snapshot.data}', style: textStyle),
                Text('Error : ${snapshot.error}', style: textStyle),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(Duration(seconds: 3));

    final random = Random();

    // throw Exception('에러가 발생했습니다.');

    return random.nextInt(100);
  }
}
