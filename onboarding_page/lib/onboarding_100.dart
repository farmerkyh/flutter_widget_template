import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboard/main.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the first page',
          image: Image.asset('image/page1.png'),
          //decoration
          //  - 이 decoration속성은 다른속성인 title, body, image에 대한 decoration을 정의한다.
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the second page',
          image: Image.asset('image/page2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the third page',
          image: Image.asset('image/page3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      //done 버튼에 보여줄 text
      done: const Text('done'),
      //onDone : done button pressed callback
      onDone: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MyPage()));
      },
      next: const Icon(Icons.arrow_forward),
      //skip 버튼 활성화
      showSkipButton: true,
      //skip 버튼 텍스트
      skip: const Text('skip'),
      //하단 step decorator
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        //Size(10, 10) : 기로, 세로 size
        size: const Size(10, 10),
        //활동화된 page : dot size
        activeSize: Size(22, 10),
        //활동화된 page : dot shape
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        //활동화된 page : dot color
        activeColor: Colors.red,
      ),
      //curve : page이동시 animation효과
      curve: Curves.bounceInOut,
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.orange,
    );
  }
}
