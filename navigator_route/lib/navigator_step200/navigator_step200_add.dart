import 'package:flutter/material.dart';

//-----------------------------------------------------------------------
// 1. ending Page (todo에 대해 - 완료 되었으면 이 Page로 이동 된다.)
//-----------------------------------------------------------------------
class NavigatorStep200Add extends StatefulWidget {
  const NavigatorStep200Add({super.key});

  @override
  State<NavigatorStep200Add> createState() => _NavigatorStep200Add();
}

class _NavigatorStep200Add extends State<NavigatorStep200Add> {
  @override
  Widget build(BuildContext context) {
    final todoCnt = ModalRoute.of(context)!.settings.arguments as int;
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('현재 TODO 갯수 - [ $todoCnt ] 입니다.'),
            const SizedBox(height: 30.0),
            const Text('혹시 또 추가할 TODO가 있으면 입력 해'),
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 30.0),
            //-----------------------------------------------
            //완료 RadioButton
            //-----------------------------------------------
            BackButton(name: 'Todo 추가해줘', rtnVale: controller),
            const SizedBox(height: 30.0),

            //-----------------------------------------------
            //돌아가기 Button
            //-----------------------------------------------
            const BackButton(name: '<- ToDo List page로 돌아가기', rtnVale: null),
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------
// 10. 뒤로가기 버튼
//-----------------------------------------------------------------------
class BackButton extends StatelessWidget {
  final String name;
  final TextEditingController? rtnVale;
  const BackButton({required this.name, required this.rtnVale, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (rtnVale == null) {
          Navigator.of(context).pop('');
        } else {
          Navigator.of(context).pop(rtnVale!.value.text);
        }
      },
      child: Text(name),
    );
  }
}
