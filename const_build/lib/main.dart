import 'package:const_build/const/const_screen_100.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      //const를 붙였을 때와 붙이지 않았을때 build가 실행되고, 실행이 되지 않는 과정 소계
      home: ConstScreen100(),
    ),
  );
}
