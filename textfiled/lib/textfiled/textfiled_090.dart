import 'package:flutter/material.dart';

class TextFiled090 extends StatefulWidget {
  const TextFiled090({super.key});

  @override
  State<TextFiled090> createState() => _TextFiled090State();
}

class _TextFiled090State extends State<TextFiled090> {
  //------------------------------------------------------------------------
  // inputText : 를 이용해서 TextFiled값을 제어
  //------------------------------------------------------------------------
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Center(
        child: GestureDetector(
          //------------------------------------------------------------------------
          // FocusScope.of(context).unfocus()
          //   - 스마트폰 인 경우 TextField에 focus가 위치하면 keybord가 보여지는데,
          //     unfocus()를 이용해서 빈 화면을 터치하면 keyboard를 제거시킨다.
          //------------------------------------------------------------------------
          onTap: () => FocusScope.of(context).unfocus(),
          //------------------------------------------------------------------------
          // SingleChildScrollView
          //   - 만약, TextFiled에 focus가 위치 되면서 keyboard 가 보여지면서
          //     TextFiled를 덥는다면 오류가 발생한다.
          //     그래서 SingleChildScrollView를 이용해서 scroll이 발생하도록 한다.
          //------------------------------------------------------------------------
          child: SingleChildScrollView(
            child: Column(
              children: [
                //------------------------------------------------------------------------
                // TextField에 입력되어 지는 값이 실시간으로 Text에 보여짐
                //------------------------------------------------------------------------
                Text(inputText),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),

                  //------------------------------------------------------------------------
                  // TextField
                  //------------------------------------------------------------------------
                  child: TextField(
                    //------------------------------------------------------------------------
                    // onChanged로 값이 변경 시 실시간으로 build를 다시함
                    //------------------------------------------------------------------------
                    onChanged: (text) {
                      setState(() {
                        inputText = text;
                      });
                    },
                    //------------------------------------------------------------------------
                    // TextField - decoration
                    //------------------------------------------------------------------------
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      labelStyle: TextStyle(color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
