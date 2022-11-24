// ignore_for_file: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ThemeOfPlatform100()));

class ThemeOfPlatform100 extends StatelessWidget {
  const ThemeOfPlatform100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('child: Theme.of(context).platform')),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: const Text('Android style-TimePickerSpinner'),
          ),
          //---------------------------------------------------------------------------
          // 1. Theme.of(context).platform 문법을 이용한 os 구분해서 개발
          //---------------------------------------------------------------------------
          ElevatedButton(
            onPressed: () => getAndroidAlertDialog(context),
            child: const Text('클릭시 os구분별 Dialog호출'),
          ),

          const Expanded(child: Text('.')),
          //
          Container(color: Colors.amber, child: const Text('iOS style-AlertDialog')),
          //---------------------------------------------------------------------------
          // 2. iOS 용 AlertDialog
          //---------------------------------------------------------------------------
          const Expanded(
            child: AlertDialogExample(),
          ),
        ],
      ),
    );
  }

  void getAndroidAlertDialog(BuildContext context) {
    //구분 가능 os : android, fuchsia, iOS, linux, macOS, windows
    //---------------------------------------------------------------------------
    // 1. iOS
    //---------------------------------------------------------------------------
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      debugPrint('os - iOS');
      //---------------------------------------------------------------------------
      // 2. android
      //---------------------------------------------------------------------------
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      debugPrint('os - android');

      //---------------------------------------------------------------------------
      // 3. windows
      //       - web browser도 windows로 인식함
      //---------------------------------------------------------------------------
    } else if (Theme.of(context).platform == TargetPlatform.windows) {
      debugPrint('os - windows');
    } else {
      debugPrint('else - is, android, windows.. 이외');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: const Text('완료 상태를 바꾸시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

/*
  @class iOS형 AlertDialog
*/

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoAlertDialog Sample'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () => _showAlertDialog(context),
          child: const Text('CupertinoAlertDialog'),
        ),
      ),
    );
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
