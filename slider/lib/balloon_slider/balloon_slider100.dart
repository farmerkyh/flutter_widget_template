import 'package:flutter/material.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';

void main() {
  runApp(MaterialApp(
    home: BallonSlider100(),
  ));
}

class BallonSlider100 extends StatelessWidget {
  const BallonSlider100({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ballon Slider")),
      body: BalloonSlider(
          value: 0,
          ropeLength: 55,
          showRope: true,
          onChangeStart: (val) {},
          onChanged: (val) {},
          onChangeEnd: (val) {},
          color: Colors.indigo),
    );
  }
}
