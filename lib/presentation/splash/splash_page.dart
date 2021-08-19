import 'package:edir_frontend/presentation/splash/widgets/splash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Welcome",
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      body: Container(
        // padding: const EdgeInsets.all(10),

        child: SplashCard(),
      ),
    );
  }
}
