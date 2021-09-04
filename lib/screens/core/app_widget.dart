import 'package:edir/screens/admin/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/screens/admin/create_edir/create_edir_page.dart';
import 'package:edir/screens/admin/dashboard/dashboard_page.dart';
import 'package:edir/screens/register/register_page.dart';
import 'package:edir/screens/register/widgets/register_form.dart';
import 'package:edir/screens/sign_in/sign_in_page.dart';
import 'package:edir/screens/splash/splash_page.dart';
import 'package:edir/screens/user/dashboard/user_dashboard_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  // const AppWidget({Key? key}) : super(key: key);
  final ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.amber,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );

  final ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.amber,
    accentColor: Colors.amberAccent,
    primaryColorDark: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amberAccent),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'edir',
      home: UserDashboardPage(),
      darkTheme: _dark,
      theme: _light,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
