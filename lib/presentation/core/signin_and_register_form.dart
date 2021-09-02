import 'package:flutter/material.dart';

abstract class SignInAndRegisterForm {
  final double fontSize = 15;
  final String logoImage = 'assets/images/edir_logo.png';
  final String logoImageWithoutName =
      'assets/images/edir_logo_without_name.png';

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.amber,
    minimumSize: Size(50, 45),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
}
