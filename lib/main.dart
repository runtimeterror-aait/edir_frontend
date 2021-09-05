import 'package:edir/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:edir/auth/screens/sign_in/screens/sign_in_page.dart';
import 'package:edir/auth/screens/register/screens/register_page.dart';

void main() {
  // runApp(
  //   AppWidget(),
  // );
   MaterialApp(
      title: 'Edir',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const AppWidget(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const SignInPage()
      },
    ),
}
