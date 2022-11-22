import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageViewScreen100 extends StatefulWidget {
  const PageViewScreen100({Key? key}) : super(key: key);

  @override
  _PageViewScreen100State createState() => _PageViewScreen100State();
}

class _PageViewScreen100State extends State<PageViewScreen100> {
  Timer? timer;
  PageController controller = PageController(
    //초기 시작 페이지
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      //controller.page - 이때 page는 double 형이다.
      //  - 이유는 slide할때 중간정도쯤 가면 1.5,  1.6 과 같이 소수점이 될 수 있다.
      //  - page는 0부터 시작된다.
      //controller.animateToPage
      //  - 다음페이지로 이동하도록 설정해주는 widget
      //  - duration : slide 되는 시간이다.
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    //controller.dispose
    //    - 모든 controller는 모두 dispose를 해줘야 메모리 관리가 된다.
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome
    //  - App과 관련이 없는 상단, 하단의 color 설정
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      appBar: AppBar(title: const Text('PageView')),
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map((e) => Image.asset(
                  'asset/images/image_$e.jpeg',
                ))
            .toList(),
      ),
    );
  }
}
