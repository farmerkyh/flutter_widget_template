import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:device_info_plus/device_info_plus.dart';

class TextFiled100 extends StatefulWidget {
  const TextFiled100({super.key});

  @override
  State<TextFiled100> createState() => _TextFiled100State();
}

class _TextFiled100State extends State<TextFiled100> {
  //------------------------------------------------------------------------
  // TextEditingController : 를 이용해서 TextFiled값을 제어
  //------------------------------------------------------------------------
  final TextEditingController _textController = TextEditingController();
  Widget _changedTextWidget = Container();

  @override
  void initState() {
    //getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('TextFiled'),
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: _buildTextFieldWidget(),
      ),
    );
  }

  Widget _buildTextFieldWidget() {
    return Container(
      child: Column(
        children: [
          //Row(
          // children: [
          Flexible(
            child: TextField(
              controller: _textController,
              //------------------------------------------------------------------------
              // onSubmitted : TextFiled에서 enter key를 누르면 발생되는 event
              //------------------------------------------------------------------------
              onSubmitted: (text) {
                sendMsg(text);
              },
              //------------------------------------------------------------------------
              // onChanged : 값이 변경 시 발생되는 event
              //             suffixIcon 을 클릭 후 값이 clear된 경우에는 onChanged 호출 안됨
              //------------------------------------------------------------------------
              onChanged: (text) {
                checkText(text);
              },
              //------------------------------------------------------------------------
              // decoration
              //   - labelText : Box 좌상단에 보여주는 label
              //   - hintText  : 값이 미 존재 시 보여주는 hint
              // border
              //   - default값은 Box line이 없이 밑줄만 보여짐
              //   - OutlineInputBorder() : Box line 4곳 모두 보여짐
              // suffixIcon
              //   - Box 오른쪽에 X icon늘 보여준다.
              //   - X icon click시 값을 지워준다.
              //------------------------------------------------------------------------
              decoration: InputDecoration(
                labelText: '오늘의 상태는 어떠세요.',
                hintText: '텍스트를 입력해주세요',
                border: const OutlineInputBorder(),
                suffixIcon: _textController.text.isNotEmpty
                    // ignore: avoid_unnecessary_containers
                    ? Container(
                        child: IconButton(
                          onPressed: () {
                            _textController.clear();
                            //setState를 해줘야 되는지 잘 모르겠음
                            //없어서 화면에서는 지워짐.
                            //setState(() {});
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      )
                    : null,
              ),
            ),
          ),

          //------------------------------------------------------------------------
          // GestureDetector : 를 이용해서 [확인] 버튼 생성
          //------------------------------------------------------------------------
          GestureDetector(
            onTap: () {
              sendMsg(_textController.text);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.amber,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: const Text('입력값 확인'),
              ),
            ),
          ),
          const SizedBox(height: 20),

          //------------------------------------------------------------------------
          // 하단에 입력된 값 보여주기
          //------------------------------------------------------------------------
          // ignore: avoid_unnecessary_containers
          Container(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.amber,
              //height: 100,
              child: _changedTextWidget,
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------------------
  // Toast message로 보여줌
  //   - 실행시 : Windows용 emulator는 오류 발생 (chrome에서는 정상)
  //------------------------------------------------------------------------
  void sendMsg(String text) {
    _textController.clear();
    if (isWindowsEmulator() == false) {
      Fluttertoast.showToast(
          msg: "This is Center Short Toast", // 메시지 내용
          toastLength: Toast.LENGTH_LONG, // 메시지 시간 - 안드로이드
          gravity: ToastGravity.BOTTOM, // 메시지 위치
          timeInSecForIosWeb: 1, // 메시지 시간 - iOS 및 웹
          backgroundColor: Colors.red, // 배경
          textColor: Colors.white, // 글자
          fontSize: 16.0); // 글자 크기
    }
  }

  //------------------------------------------------------------------------
  //
  //------------------------------------------------------------------------
  void checkText(String text) {
    _changedTextWidget = Container(
      //------------------------------------------------------------------------
      // Text.rich
      //  - 하나의 스타일 보다 더 다양한 스타일의 문자들을 적용하여 문단을 만들고자 할 때 쓸 수 있는 constructor이다.
      //  - TextRich 와 기능이 비슷하다.
      //  - TextSpan을 이용해 스타일을 적용하고자 하는 만큼의 문자,문자열 지정할 수 있고, 여러개의 TextSpan을
      //    가질 수 있어 다양한 스타일이 존재하는 문단을 만들 수 있다.
      //  - style을 지정하지 않으면 Text class가 기봊ㄱ으로 적용하는 DefaultTextStyle이 적용된다.
      // TextSpan
      //  - 특정길이의 문자(text)를 한 단위로 하여 스타일(style)을 적용하는데 사용
      //------------------------------------------------------------------------
      child: Text.rich(
        TextSpan(
          text: '입력값은 = ', //기본 스타일의 텍스트(default text style)
          children: [
            TextSpan(
              // ignore: unnecessary_string_interpolations
              text: '$text',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );

    setState(() {}); //setState를 사용하여 화면 다시 그려줌
  }

  //------------------------------------------------------------------------
  //  실행브라우져 알아내기
  //------------------------------------------------------------------------
  bool isWindowsEmulator() {
    bool isWindows = true;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

    //IosDeviceInfo iosInfo = deviceInfo.iosInfo as IosDeviceInfo;
    //print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

    //windows 인 경우 : windowsInfo.toString() -> flutter: Running on Instance of 'WindowsDeviceInfo'
    //chrome에서는    : 오류 발생
    try {
      var windowsInfo = deviceInfo.windowsInfo;
      //isWindows = true;
    } catch (e) {
      isWindows = false;
    }

    //print('Running on 1 ${windowsInfo.computerName}'); //DESKTOP-KJIHBQE
    //print('Running on 2 ${windowsInfo.platformId}');
    //print('Running on 3 ${windowsInfo.productName}'); //Windows 10 Pro

    //chrome 인 경우 : Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36    webBrowserInfo.
    //windows에서는  : 오류 발생
    //WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    //print('Running on ${webBrowserInfo.userAgent}');
    return isWindows;
  }
}
