import 'package:flutter/material.dart';

class ConstScreen100 extends StatefulWidget {
  const ConstScreen100({Key? key}) : super(key: key);

  @override
  State<ConstScreen100> createState() => _ConstScreen100State();
}

class _ConstScreen100State extends State<ConstScreen100> {
  @override
  Widget build(BuildContext context) {
    print('_ConstScreen100State - 빌드실행');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //const TestWidget
          //  - 앞쪽에 const를 붙이지 않으면 TestWidget() class의 Build를 매번 수행한다.
          //  - 하지만 const를 붙이게 되면 TestWidget() class의 Build는
          //    처음 생성 시 한번만 수행 되고, 버튼클릭시에는 Build가 수행되지 않는다.
          //  - 이로 인해 한번 그린 Widget들은 다시 그리지 않는다.
          //    재 사용하게 된다.
          //TestWidget(label: 'test1'),
          //TestWidget(label: 'test2'),
          const TestWidget(label: 'test1'),
          const TestWidget(label: 'test2'),
          //ElevatedButton
          //  - 앞쪽에는 onPressed 때문에 const를 붙일 수 가 없다.
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('빌드!'))
        ]),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  final String label;
  const TestWidget({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label - 빌드실행');
    return Container(
      child: Text(label),
    );
  }
}
