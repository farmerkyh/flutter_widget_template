import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen100 extends StatelessWidget {
  WebViewController? controller;
  final homeUrl = 'https://blog.codefactory.ai';
  //WebViewController 변수가 final 로 선언되지 않았기 때문에 const삭제 필요
  //const WebViewScreen100({super.key});
  WebViewScreen100({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Coding'),
        actions: [
          IconButton(
              onPressed: () {
                if (controller == null) {
                  return;
                }
                controller?.loadUrl(homeUrl);
              },
              icon: Icon(Icons.home))
        ],
        centerTitle: true,
      ),
      // WebView
      //    onWebViewCreated : webView가 생성이 되면 WebViewController 를 받을 수 있는 callback이다.
      //    javascriptMode : javascript가 실행될 수 있도록 설정
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
