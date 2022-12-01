import 'package:flutter/material.dart';

//-----------------------------------------------------------------------
// 1. Todo Page (todo에 대해 - Radio버튼으로 완료 여부 처리)
//-----------------------------------------------------------------------
class NavigatorStep200Todo extends StatefulWidget {
  const NavigatorStep200Todo({super.key});

  @override
  State<NavigatorStep200Todo> createState() => _NavigatorStep200Todo();
}

enum TodoFlag { YES, NO, QUESTION }

class _NavigatorStep200Todo extends State<NavigatorStep200Todo> {
  TodoFlag _todoFlag = TodoFlag.YES;
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    final Map<String, String> todo = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //------------------------------------------------------
    //반드시 '미완료'상태만 넘어오지만 .. 연습삼아 if문장 기술
    //isChanged이 필요한 이유
    //   - 이유 : radio버튼이 변경 되면 re build() 하기 때문에 아래 IF문장은 한번만 수행 되어야 한다.
    //------------------------------------------------------
    if (isChanged == false && todo['flag'] == 'YES') {
      _todoFlag = TodoFlag.YES;
    } else if (isChanged == false && todo['flag'] == 'NO') {
      _todoFlag = TodoFlag.NO;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('할일 좀 하고 삽시다.'),
            const SizedBox(height: 30.0),
            Text('지금 할일 : ${todo["subject"]}'),
            const SizedBox(height: 30.0),
            //-----------------------------------------------
            //완료 RadioButton
            //-----------------------------------------------
            ListTile(
              title: const Text('했다'),
              leading: Radio(
                value: TodoFlag.YES,
                groupValue: _todoFlag,
                onChanged: (value) {
                  setState(() {
                    _todoFlag = value!;
                    isChanged = true;
                  });
                },
              ),
            ),
            //-----------------------------------------------
            //미완료 RadioButton
            //-----------------------------------------------
            ListTile(
              title: const Text('오늘 못해'),
              leading: Radio(
                value: TodoFlag.NO,
                groupValue: _todoFlag,
                onChanged: (value) {
                  setState(() {
                    _todoFlag = value!;
                    isChanged = true;
                  });
                },
              ),
            ),
            //-----------------------------------------------
            //몰러 RadioButton
            // - Radio버튼 생성을 class방식으로 생성하려고 했지만 실패
            //-----------------------------------------------
            // ListTile(
            //     title: const Text('몰러'),
            //     leading: _MakeRadio(value: TodoFlag.QUESTION, groupValue: _todoFlag, onChanged: _RadiOnChanged)),

            //-----------------------------------------------
            //돌아가기 Button
            //-----------------------------------------------
            BackButton(
              name: '<- 결과를 가지고 돌아가기',
              rtnVale: (_todoFlag == TodoFlag.YES ? 'YES' : 'NO'),
            ),
          ],
        ),
      ),
    );
  }

  //삭제 금지-차후 추가 개발해야 됨
  // void _RadiOnChanged() {
  //   (value) {
  //     setState(() {
  //       _todoFlag = value!;
  //       isChanged = true;
  //     });
  //   };
  // }
}

//삭제 금지-차후 추가 개발해야 됨
// class _MakeRadio extends StatelessWidget {
//   final value;
//   final groupValue;
//   final ValueChanged onChanged;

//   _MakeRadio({required this.value, required this.groupValue, required this.onChanged, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Radio(value: value, groupValue: groupValue, onChanged: onChanged);
//   }
// }

//-----------------------------------------------------------------------
// 10. 뒤로가기 버튼
//-----------------------------------------------------------------------
class BackButton extends StatelessWidget {
  final String name;
  final Object rtnVale;
  const BackButton({required this.name, required this.rtnVale, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop(rtnVale);
      },
      child: Text(name),
    );
  }
}
