// ignore_for_file: camel_case_types
import 'dart:io' show Platform;
import 'package:flutter_spinbox/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DartIoScreen100()));

class DartIoScreen100 extends StatelessWidget {
  const DartIoScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('dart:io')),
      body: Column(
        children: [
          Container(color: Colors.amber, child: const Text('Android style-SpinBox')),
          //---------------------------------------------------------------------------
          // 1. dart.io 문법을 이용한 os 구분해서 개발
          //---------------------------------------------------------------------------
          const Expanded(child: getAndroidSpinBox()),
          Container(color: Colors.amber, child: const Text('iOS style-CupertinoSlider')),

          //---------------------------------------------------------------------------
          // 2. iOS 용 CupertinoSlider
          //---------------------------------------------------------------------------
          const Expanded(child: getCupertinoSlider()),
        ],
      ),
    );
  }
}

/*
  @class Android형 SpinBox
*/
class getAndroidSpinBox extends StatelessWidget {
  const getAndroidSpinBox({super.key});

  @override
  Widget build(BuildContext context) {
    //구분 가능 os : isAndroid, isFuchsia, isIOS, isLinux, isMacOS, isWindows
    //---------------------------------------------------------------------------
    // 1. iOS
    //---------------------------------------------------------------------------
    if (Platform.isAndroid) {
      const Text('난 iOS야.. 테스트를 할 수 없어.');
      //---------------------------------------------------------------------------
      // 2. Android
      //---------------------------------------------------------------------------
    } else if (Platform.isIOS) {
      debugPrint('os - android');

      //---------------------------------------------------------------------------
      // 3. windows
      //---------------------------------------------------------------------------
    } else if (Platform.isWindows) {
      debugPrint('os - windows');

      //---------------------------------------------------------------------------
      // - 웹브라우져 : 오류 발생
      //   오류내역   : Unsupported operation: Platform._operatingSystem
      //---------------------------------------------------------------------------

    } else {
      debugPrint('else - is, android, windows.. 이외');
    }

    return SpinBox(
      min: 1,
      max: 100,
      value: 50,
      onChanged: (value) => debugPrint('Adroind SpinBox - value = $value'),
    );
  }
}

/*
  @class iOS형 CupertinoSlider
*/
class getCupertinoSlider extends StatefulWidget {
  const getCupertinoSlider({super.key});

  @override
  State<getCupertinoSlider> createState() => _getCupertinoSliderState();
}

class _getCupertinoSliderState extends State<getCupertinoSlider> {
  double sliderVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: sliderVal,
      max: 100,
      onChanged: (double value) {
        setState(() {});
        sliderVal = value;
        debugPrint('CupertinoSlider - value = $value');
      },
    );
  }
}
