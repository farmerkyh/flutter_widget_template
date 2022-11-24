// ignore_for_file: camel_case_types
import 'package:flutter/cupertino.dart'; //CupertinoPicker widget용
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; //defaultTargetPlatform 이라는 변수사용용
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() => runApp(const MaterialApp(home: FoundationScreen100()));

class FoundationScreen100 extends StatelessWidget {
  const FoundationScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Foundation')),
      body: Column(
        children: [
          const Text('Android style-TimePickerSpinner'),
          const Expanded(
            child: getTimePickerSpinner(),
          ),
          const Text('iOS style-CupertinoPicker'),
          Expanded(
            child: getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}

/*
  @class Android형 TimePickerSpinner
*/
class getTimePickerSpinner extends StatelessWidget {
  const getTimePickerSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    //TargetPlatform.enum : android, fuchsia,iOS,linux,macOS,windows,
    //---------------------------------------------------------------------------
    // 1. iOS
    //---------------------------------------------------------------------------
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const Text('난 iOS야.. 테스트를 할 수 없어.');

      //---------------------------------------------------------------------------
      // 2. Android
      //---------------------------------------------------------------------------
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      debugPrint('os - android');

      //---------------------------------------------------------------------------
      // 3. windows
      //       - web browser도 windows로 인식함
      //---------------------------------------------------------------------------
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      debugPrint('os - windows');
    } else {
      debugPrint('else - is, android, windows.. 이외');
    }

    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(fontSize: 24, color: Colors.deepOrange),
      highlightedTextStyle: const TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        debugPrint('selected tiem -> $time');
      },
    );
  }
}

/*
  @class iOS형 CupertinoPicker
*/
class getCupertinoPicker extends StatelessWidget {
  final List<int> _items = List.generate(10, (index) => index);
  getCupertinoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50.0,
      onSelectedItemChanged: (int value) {
        debugPrint('selected->$value');
      },
      children: _items.map((e) => Text('No $e')).toList(),
    );
  }
}
