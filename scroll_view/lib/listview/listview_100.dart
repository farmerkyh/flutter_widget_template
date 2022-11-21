import 'package:flutter/material.dart';

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
          Container(height: 500, color: Colors.grey),
          Container(height: 500, color: Colors.yellow),
          Container(height: 500, color: Colors.blue),
        ],
      ),
    );
  }
}
