import 'package:flutter/material.dart';

class StateFull100 extends StatefulWidget {
  final Color color;

  //Constructor
  //  - StateFull100 이 class가 호출될때(instance화 될때) 마다 Constructor는 다시 수행된다.
  //  - Widget은 immutable하므로 기존 Widget은 삭제 후 재 생성하게 된다.
  //  - 하지만 재 사용하는 것들도 있다.
  //  - createState() 는 맨 처음 한번만 실행이 되고
  //                  재 생성할 때는 실행되지 않는다. (재 사용하므로)
  //                  그대신 didChangeDependencies ()가 실행 된다.
  StateFull100({
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('-----------------------------');
    print('Widget Constructor 실행!');
  }

  @override
  _StateFull100State createState() {
    print('createState 실행!');
    return _StateFull100State();
  }
}

class _StateFull100State extends State<StateFull100> {
  int number = 0;

  @override
  void initState() {
    print('initState 실행!');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행!');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('-----------------------------');
    print('deactivate 실행!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행!');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StateFull100 oldWidget) {
    print('didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return GestureDetector(
      onTap: () {
        setState(() {
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(
            number.toString(),
          ),
        ),
      ),
    );
  }
}
