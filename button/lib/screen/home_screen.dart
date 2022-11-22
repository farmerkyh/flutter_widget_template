import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("버튼")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //----------------------------------------------------------
            // MaterialState - Fultter전체 Widget기준으로 State
            //  - values :
            //  - hovered : 호버링 상태(마우스 커서를 올려놓은 상태)(웹상)
            //  - focused : 포커스 됐을 때 (텍스트 필드 일 경우)(버튼은 대상이 아님)
            //  - pressed : 눌렸을때
            //  - dragged : 드래그 됐을 때
            //  - selected : 선택됐을때 (체크박스, 라디오버튼일 경우)
            //  - scrollUnder : 다른 컴포넌트 밑으로 스크롤이 됐을때
            //  - disabled : 비활성화 됐을 때
            //  - error : 에러상태 (텍스트 필드)
            //----------------------------------------------------------
            // MaterialState - 버튼에서 사용되는 State
            //  - focused : 포커스 됐을 때 (텍스트 필드 일 경우)(버튼은 대상이 아님)
            //  - disabled : 비활성화 됐을 때
            //----------------------------------------------------------
            // ElevatedButton, OutlinedButton, TextButton
            //  - 기본형태의 버튼 모양만 다르다.
            //  - style을 동일하게 적용하면 3가지 버튼모양을 동일하게 만들 수 있다.
            //----------------------------------------------------------
            //onPressed: null
            //  - null값을 적용 시 : 버튼이 비활성화(disabled)되어 텍스트값도 보이지 않는다.

            //----------------------------------------------------------
            // ElevatedButton
            //   - 3D형태의 버튼
            //----------------------------------------------------------
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, //버튼 color
                foregroundColor: Colors.red, //font color
                shadowColor: Colors.green, //그림자 컬러
                elevation: 10.0,
                padding: EdgeInsets.all(32), //버튼과 Text간에 Padding
                side: BorderSide(color: Colors.black, width: 4.0), //버튼 테두리
              ), //elevation : 버튼을 좀더 튀어나오게 하는 효과.
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                //버튼이 눌렸을 때 font Color를 white, 안눌렸을 때red로 처리
                //  - 아래 같이 MaterialState 속성은 모든 style에 사용가능 하다.
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  } else {
                    return Colors.black;
                  }
                  //return null;  //기본 color가 적용 됨
                }),

                //어떠한 상태에서도 backgroundColor를 동일하게 적용
                //backgroundColor: MaterialStateProperty.all(Colors.black;),

                //버튼이 눌렸을 때 font Color를 white, 안눌렸을 때red로 처리
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  } else {
                    return Colors.red;
                  }
                }),
                padding: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return EdgeInsets.all(100);
                  } else {
                    return EdgeInsets.all(32);
                  }
                }),
              ),
              child: const Text('ElevatedButton-ButtonStyle'),
            ),
            const SizedBox(height: 30),

            //----------------------------------------------------------
            // OutlinedButton
            //    - 테두리만 존재하는 버튼
            //----------------------------------------------------------
            OutlinedButton(
                onPressed: () {},
                //ElevatedButton.styleFrom() 도 되기는 함.
                //style: ElevatedButton.styleFrom()
                //foregroundColor
                //  - font color와 click시 enimation효과 color가 같이 적용됨
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.all(32)),
                child: const Text('OutlinedButton')),
            const SizedBox(height: 30),

            //----------------------------------------------------------
            // TextButton
            //   - 텍스트만 보이는 버튼
            //----------------------------------------------------------
            TextButton(onPressed: () {}, child: Text('TextButton')),
          ],
        ),
      ),
    );
  }
}
