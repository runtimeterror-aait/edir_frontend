import 'package:flutter/material.dart';

class Styles {
  final TextStyle textStyle_0 = TextStyle(fontSize: 12);
  final TextStyle textStyle_1 = TextStyle(fontSize: 15);
  final TextStyle textStyle_2 = TextStyle(fontSize: 18);
  final TextStyle textStyle_3 = TextStyle(fontSize: 21);
  final TextStyle textStyle_4 = TextStyle(fontSize: 24);
  final TextStyle textStyle_5 = TextStyle(fontSize: 30);
  final TextStyle textStyle_6 = TextStyle(fontSize: 40);
  final TextStyle textStyle_7 = TextStyle(fontSize: 50);

  final TextStyle textStyleBold_0 =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_1 =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_2 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_3 =
      TextStyle(fontSize: 21, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_4 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_5 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_6 =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  final TextStyle textStyleBold_7 =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);

  final ButtonStyle roundedElevatedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.amber,
    minimumSize: Size(70, 40),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );
}
