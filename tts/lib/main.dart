import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

// speak: TTS로 글씨를 읽는다.
// stop: 현재 읽고 있는 TTS를 중지한다.
// get languages: TTS가 지원하는 언어 리스트를 가져온다.
// set language: TTS의 언어를 설정한다.
// set speech rate: TTS의 읽기 속도를 설정한다.
// set speech volume: TTS의 볼륨을 조절한다.
// get voices: TTS가 지원하는 음성 리스트를 가져온다.
// set voice: TTS의 음성을 설정한다.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FlutterTts tts = FlutterTts();

  final TextEditingController controller = TextEditingController(text: 'Hello world');

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.5); //속도 빠르기 설정
    tts.setPitch(1); //목소리 톤 설정
  }

  @override
  void dispose() {
    super.dispose();
    tts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                tts.speak(controller.text);
                //tts.speak("Hellow world");
                print('1');
              },
              child: Text('Speak'))
        ],
      ),
    );
  }
}
