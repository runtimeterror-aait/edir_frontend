import 'package:edir/admin/screens/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/admin/screens/create_edir/create_edir_page.dart';
import 'package:edir/admin/screens/dashboard/dashboard_page.dart';
import 'package:edir/auth/screens/register/screens/register_page.dart';
import 'package:edir/auth/screens/register/screens/widgets/register_form.dart';
import 'package:edir/auth/screens/sign_in/screens/sign_in_page.dart';
import 'package:edir/splash/screens/splash_page.dart';
import 'package:edir/user/screens/dashboard/user_dashboard_page.dart';
import 'package:flutter/material.dart';

const SplashRoute = "/";
const RegisterRoute = "/register";
const LoginRoute = "/login";

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
      onGenerateRoute: _routes(),
      title: 'edir',
      // home: SplashPage(),
      darkTheme: _dark,
      theme: _light,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case SplashRoute:
          screen = SplashPage();
          break;
        case RegisterRoute:
          screen = RegisterPage();
          break;
        case LoginRoute:
          screen = SignInPage();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
