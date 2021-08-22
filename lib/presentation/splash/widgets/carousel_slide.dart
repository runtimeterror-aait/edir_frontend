import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSlide extends StatelessWidget {
  const CarouselSlide({Key? key, required this.items}) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: CarouselSlider(
          items: this.items,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 1.3,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          )),
    );
  }
}
