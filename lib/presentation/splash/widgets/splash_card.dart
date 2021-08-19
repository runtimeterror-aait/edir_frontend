import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({Key? key}) : super(key: key);
  final supportImage = 'assets/images/support.png';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.amber[100],
      minimumSize: Size(150, 45),
    );
    return Card(
      child: Column(
        children: <Widget>[
          CarouselSlider(
              items: [
                Column(
                  children: [
                    Image.asset(
                      supportImage,
                      height: 200,
                    ),
                    Text("Support eachother in hard times.")
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      supportImage,
                      height: 200,
                    ),
                    Text("Sign in to an existing Edri.")
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      supportImage,
                      height: 200,
                    ),
                    Text(
                      "You can also create a new  Edir organization .",
                    )
                  ],
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 1.2,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              )),
          Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(),
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(20))),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Welcome to Edir',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                  subtitle: Text(
                    'Edir is a society organization in which people help eachohter in hard tiimes. You can create your own edir or signup for an existing one.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: raisedButtonStyle,
                      child: const Text('Sign up'),
                      onPressed: () {/* ... */},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: raisedButtonStyle,
                      child: const Text('Create Edir'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
