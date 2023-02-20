import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CarouselSlider100()));
}

class CarouselSlider100 extends StatelessWidget {
  const CarouselSlider100({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ));
  }
}
