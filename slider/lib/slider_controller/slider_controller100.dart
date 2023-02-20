import 'package:flutter/material.dart';
import 'package:slider_controller/slider_controller.dart';

void main() {
  runApp(MaterialApp(
    home: SliderController100(),
  ));
}

class SliderController100 extends StatelessWidget {
  const SliderController100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SliderController")),
        body: SliderController(
          value: 50.0,
          onChanged: (value) {
            print('slider value : $value');
          },
        ));
    ;
  }
}
