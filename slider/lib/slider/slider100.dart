import 'package:flutter/material.dart';
import 'package:slider_controller/slider_controller.dart';

void main() {
  runApp(MaterialApp(
    home: Slider100(),
  ));
}

class Slider100 extends StatefulWidget {
  const Slider100({super.key});

  @override
  State<Slider100> createState() => _Slider100State();
}

class _Slider100State extends State<Slider100> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 5,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          print(value);
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}
