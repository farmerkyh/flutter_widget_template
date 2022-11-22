import 'package:flutter/material.dart';

/*
  Desc : ListView() Widget으로 scroll이 되도록 처리
*/
class ListView100 extends StatelessWidget {
  const ListView100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview'),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(height: 500, color: Colors.grey, child: const Text('일차/삼차')),
          Container(height: 500, color: Colors.yellow, child: const Text('이차/삼차')),
          Container(height: 500, color: Colors.blue, child: const Text('삼차/삼차')),
        ],
      ),
    );
  }
}
