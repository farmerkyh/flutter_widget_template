// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class TextFiled110Login extends StatefulWidget {
  const TextFiled110Login({super.key});

  @override
  State<TextFiled110Login> createState() => _TextFiled110LoginState();
}

class _TextFiled110LoginState extends State<TextFiled110Login> {
  final _idTextEditController_1 = TextEditingController();
  final _idTextEditController_2 = TextEditingController();
  final _passwordTextEditController_1 = TextEditingController();
  final _passwordTextEditController_2 = TextEditingController();

  //login 가능여부 검증
  bool _isValid() {
    return (_idTextEditController_1.text.length >= 4 && _passwordTextEditController_1.text.length >= 4);
  }

  // 로그인 하기
  void _login() {
    debugPrint('로그인 성공');
  }

  // 로그인 실패
  void _loginFail() {
    debugPrint('아이디, 패스워드를 입력하시오');
  }

  void _signup() {
    // 회원가입 하기
    debugPrint('회원가입 하로 가기');
  }

  @override
  Widget build(BuildContext context) {
    var _idTextField = TextField(
      controller: _idTextEditController_1,
      decoration: const InputDecoration(
        hintText: "아이디-1",
        labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
      ),
      onChanged: (text) {
        setState(() {});
      },
    );

    var _passwordTextField = TextField(
      controller: _passwordTextEditController_1,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "비밀번호-1",
        //padding: EdgeInsets.all(10),
        labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
      ),
      onChanged: (text) {
        setState(() {});
      },
    );

    var _loginButton = ElevatedButton(
      onPressed: _isValid() ? _login : _loginFail,
      child: const Text("로그인", style: TextStyle(fontSize: 16)),
    );

    var _signupButton = ElevatedButton(
      onPressed: _signup,
      child: const Text(
        "회원가입하기",
        style: TextStyle(fontSize: 16),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('TextFiled Login'),
      ),
      body: Container(
        //color: Colors.amber[200],
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(" ** 변수형식으로 만든 아이디,비밀번호 TextField"),
              //------------------------------------------------------------------------
              // 변수형식으로 만든 id, pw
              //------------------------------------------------------------------------
              _idTextField,
              const SizedBox(height: 10),
              _passwordTextField,
              const SizedBox(height: 10),
              _loginButton,
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [_signupButton],
              ),
              //
              //------------------------------------------------------------------------
              // 함수방식으로 만든 id, pw
              //------------------------------------------------------------------------
              const SizedBox(height: 50),
              const Text(" ** 함수방식으로 만든 아이디,비밀번호 TextField"),
              makeLoginTextField("USERID"),
              const SizedBox(height: 10),
              makeLoginTextField("PASSWORD"),
            ],
          ),
        ),
      ),
    );
  }

  //------------------------------------------------------------------------
  // @class 사용자id, 패스워드용 TextField 만들기
  //------------------------------------------------------------------------
  TextField makeLoginTextField(String name) {
    String label;
    if (name == 'USERID') {
      label = "사용자 ID";
    } else {
      label = "패스워드";
    }

    return TextField(
      controller: _idTextEditController_2,
      obscureText: true,
      decoration: InputDecoration(
        hintText: label,
        //padding: EdgeInsets.all(10),
        labelStyle: const TextStyle(fontSize: 16, color: Colors.amber),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
      ),
      onChanged: (text) {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _idTextEditController_1.dispose();
    _idTextEditController_2.dispose();
    _passwordTextEditController_1.dispose();
    _passwordTextEditController_2.dispose();
    super.dispose();
  }
}
