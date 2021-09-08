import 'package:edir/splash/screens/widgets/carousel_slide.dart';
import 'package:edir/splash/screens/widgets/splash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String image1 = 'assets/images/support.png';
String text1 = "Welcome to Edir";

String image2 = 'assets/images/support.png';
String text2 = "We support your loved once in hard times";

String image3 = 'assets/images/support.png';
String text3 = "We support your loved ones in hard times";

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  List<Widget> items = [
    _CarouselItems(image: image1, text: text1).col(),
    _CarouselItems(image: image2, text: text2).col(),
    _CarouselItems(image: image3, text: text3).col(),
  ];

  String waveImage = 'assets/images/wave.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Center(
            child: Text(
              "Welcome",
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              color: Colors.amber,
              child: CarouselSlide(
                items: this.items,
              ),
            ),
            Image.asset(
              waveImage,
            ),
            Spacer(),
            SplashCard(),
          ],
        ),
      ),
    );
  }
}

class _CarouselItems {
  final String image;
  final String text;
  final double space;
  const _CarouselItems(
      {required this.image, required this.text, this.space = 30});
  Widget col() {
    return Column(
      children: [
        Image.asset(
          image,
          height: 200,
        ),
        SizedBox(
          height: space,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
