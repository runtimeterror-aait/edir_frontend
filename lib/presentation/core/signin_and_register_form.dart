import 'package:flutter/material.dart';

abstract class SignInAndRegisterForm extends StatelessWidget {
  SignInAndRegisterForm({Key? key}) : super(key: key);

  ///Returns a form widget
  Widget get formWidget;
  final double fontSize = 15;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.amber,
    minimumSize: Size(50, 45),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return formWidget;
  }
}
