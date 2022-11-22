import 'package:flutter/material.dart';

/*
  Desc : Column + ListView.builder Widget을 이용해서 구성
*/
class ColumnScreen120 extends StatelessWidget {
  const ColumnScreen120({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column + ListView.builder")),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          //
          //
          //

          child: Column(
            children: [
              ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const Text('ListView List');
                },
              ),
            ],
          ),

          //
          //
          //
        ),
      ),
    );
  }
}
