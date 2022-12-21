import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilder100 extends StatefulWidget {
  const StreamBuilder100({Key? key}) : super(key: key);

  @override
  _StreamBuilder100State createState() => _StreamBuilder100State();
}

class _StreamBuilder100State extends State<StreamBuilder100> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16.0,
    );

    return Scaffold(
      appBar: AppBar(title: Text('StreamBulder')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //StreamBuilder.future 정의
        // - Future를 Return해주는 어떠한 함수든 다 넣을 수 있다.
        // - 이 함수의 상태가 변경 될 때마다 StreamBuilder.builder를 다시 실행하게 하여
        //   화면을 다시 그려질 수있도록 한다.
        // - 변경이란 : Loading중이거나, 끝났거나, 또는 어떤 값이 Return되었거나, error가 났거나
        //             이런 상태가 변경 되면 받게 된다.
        // - build()method는 다시 실행하지 않고, builder:의 callback만 다시 실행해준다.
        //StreamBuilder.builder
        // - 실행
        //StreamBuilder > builder > snapshot
        // - 이 snapshot 속성으로 변경된 값을 받아서 사용할 수 있다.
        //StreamBuilder Generic
        // - StreamBuilder Generic이 존재 한다.
        // - StreamBuilder<Object> 과 같은 형식이다.
        // - 이 때 <Object>와 같으 Generic은 Stream:속성의 return type이다.
        //   즉, 아래에서는 checkPermission() 메서드의 return type이다.
        //   snapshot.data의 type이다.
        // - Generic은 생략해도 알아서 인지해서 적용 된다.
        //추가장점
        // - Stream은 보통 한번 열게 되면 닫아줘야 된다.
        // - StreamBuilder는 모든 stream을 닫는거 까지 알아서 다 해준다.
        child: StreamBuilder<int>(
          stream: streamNumbers(),
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
                  'StreamBuilder',
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 20.0),
                ),
                //connectionState
                //  - none,waiting,active,done 이 4가지 상태가 존재 한다.
                //  - active : StringBuilder에서만 사용 된다.
                //             함수가 처음 return값이 시작 되고, 종료가 되기전까지의 상태 이다.
                //  - none,waiting,done : FutureBuilder에서는 이 3가지만 사용 된다.
                //    . none : FutureBuilder parameter를 안썼을 때의 상태
                //    . waiting : FutureBuilder가 Loading중(실행)일 때의 상태
                //    . done : FutureBuilder가 완료 되었을 때의 상태
                //  * 즉, 위와 같은 상태를 기반으로 googlemap을 체크하고 처리할 수 있다.
                //    FutureBuilder가 완료 된 상태를 검증해서,
                //    완료 되었다면 data값을 읽어 처리 하게 된다.
                //  * 이런 처리들은 future속성에서 정의한 checkPermission() 함수의 결과에 따라
                //    처리 된다.
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

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        throw Exception('i = 5');
      }

      await Future.delayed(Duration(seconds: 1));

      yield i;
    }
  }
}
