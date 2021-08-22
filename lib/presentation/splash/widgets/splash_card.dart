import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SplashCard extends StatelessWidget {
  SplashCard({Key? key}) : super(key: key);
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.amber,
    minimumSize: Size(150, 45),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),

      // margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text('Welcome to Edir',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(
                'Edir is a society organization in which people help eachohter in hard tiimes. You can create your own edir or signup for an existing one.',
              ),
            ),
            SizedBox(
              height: 15,
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
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign in'),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
