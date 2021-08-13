import 'package:edir_frontend/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  // const AppWidget({Key? key}) : super(key: key);
  final ThemeData _light = ThemeData.light().copyWith(
      primaryColor: Colors.amber,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
  final ThemeData _dark = ThemeData.dark().copyWith(
      primaryColor: Colors.amber,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'edir',
      home: SignInPage(),
      darkTheme: _dark,
      theme: _light,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
