import 'package:flutter/material.dart';
import 'package:u_and_i/date_screen/date_screen_100.dart';
import 'package:u_and_i/date_screen/date_screen_110.dart';
import 'package:u_and_i/date_screen/date_screen_120.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme 정의는 오류가 나서 주석처리
      // theme: ThemeData(
      //   fontFamily: 'sunflower',
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(
      //         color: Colors.white, fontFamily: 'parisienne', fontSize: 80.0),
      //     headline2: TextStyle(
      //         color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w700),
      //     bodyText1: TextStyle(color: Colors.white, fontSize: 30.0),
      //     bodyText2: TextStyle(color: Colors.white, fontSize: 20.0),
      //   ),
      // ),

      //DateScreen100, DateScreen110 소스작동을 100% 동일하다.
      // - 다른점 : DateScreen100 소스에서 상태관리가 class별로 분리 되어 있기때문에
      //           관리에 어려움이 있어 보인다.
      //           그래서 상태관리만 하나로 합치는 소스가 DateScreen110 이다.
      //DateScreen110 - DateScreen100에서 변경한 내용
      //  1. _TopPart class를 StatelessWidget 으로 변경
      //  2. 하트 IconButton의 onPressed Event를 상위로 이동 후 function 생성 (onHeartPressed)
      //DateScreen120
      //  1. 위쪽에 있는 theme에서 오류가 없다면 적용가능한 class
      //  2. 오류 발생으로 theme부분은 주석처리 했음
      //home: DateScreen100(),
      home: DateScreen110(),
      //home: DateScreen120(),  <--실행불가 오류
    ),
  );
}
