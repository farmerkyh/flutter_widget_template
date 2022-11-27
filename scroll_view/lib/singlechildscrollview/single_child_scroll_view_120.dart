/*
singleChildScrollView 안에 있는 위젯들은 모두 랜더링이 완료가 된 상태다.
즉, 데이터가 100개를 소유하고 있다면 100개가 다 완료되고 나서 앱은 화면을 보여준다.
*/
import 'package:flutter/material.dart';

/*
  Desc : SingleChildScrollView() Widget을 이용해서 child에 존재하는 Widget들을 scroll 기능 구현하기 + 화면에 2개 구현
           - 위쪽 Widget은 상/하 scroll
           - 아래쪽 Widget은 좌/우 scroll
*/
class SingleChildScrollView120 extends StatelessWidget {
  const SingleChildScrollView120({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView(120)'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            //-------------------------------------------------------------------------
            // 1. SingleChildScrollView (상/하 scroll)
            //-------------------------------------------------------------------------
            child: SingleChildScrollView(
              //NeverScrollableScrollPhysics :scroll 안됨
              //AlwaysScrollableScrollPhysics
              // - 화면이 넘어서야만 scroll이 되지만 강제로 scroll이 되도록 해준다.
              //BouncingScrollPhysics
              // - 위쪽으로 더이상 갈곳이 없을 경우에는 빈 공백이 나오도록 해주는 효과
              // - ios style임
              //ClampingScrollPhysics
              // - 위쪽으로 더이상 갈곳이 없을 경우에는 그대로 멈춰 있는다.
              // - android style
              physics: ClampingScrollPhysics(),
              //physics: AlwaysScrollableScrollPhysics(),
              // - physics속성만 정의하면 화면이 짤린다.
              //   화면이 짤리지 않고, scroll이 되도록 해 준다.
              clipBehavior: Clip.none,
              scrollDirection: Axis.vertical,

              //-------------------------------------------------------------------------
              // 2. child
              //    - child하위의 Widget들로 scroll item을 구성 한다.
              //-------------------------------------------------------------------------
              child: Column(
                children: [
                  Container(height: 150, color: Colors.amberAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              color: Colors.grey,
              //-------------------------------------------------------------------------
              // 3. SingleChildScrollView (좌/우 scroll)
              //-------------------------------------------------------------------------
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('옆으로 가자  --> ' * 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
