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
      //-------------------------------------------------------------------------
      // 1. ListView
      //-------------------------------------------------------------------------
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        //-------------------------------------------------------------------------
        // 2. itemBuilder가 존재하지 않으며, count가 존재 하지 않는다.
        //    children하위의 Widget들로 Grid가 구성 된다.
        //-------------------------------------------------------------------------
        children: <Widget>[
          Container(height: 500, color: Colors.grey, child: const Text('일차/삼차')),
          Container(height: 500, color: Colors.yellow, child: const Text('이차/삼차')),
          Container(height: 500, color: Colors.blue, child: const Text('삼차/삼차')),
        ],
      ),
    );
  }
}
