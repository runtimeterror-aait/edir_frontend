import 'package:edir/admin/screens/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/home/admin_home_page.dart';
import 'package:edir/admin/screens/create_edir/create_edir_page.dart';
import 'package:edir/admin/screens/dashboard/dashboard_page.dart';
import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/bloc/auth_state.dart';
import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/repository/auth_repository.dart';
import 'package:edir/auth/screens/register/screens/register_page.dart';
import 'package:edir/auth/screens/register/screens/widgets/register_form.dart';
import 'package:edir/auth/screens/sign_in/screens/sign_in_page.dart';
import 'package:edir/splash/screens/splash_page.dart';
import 'package:edir/user/screens/dashboard/user_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

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

  AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(GetLoggedInUser()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoggedInUser) {
              var user = state.login;
              if (user.role == "a") {
                navService.pushNamed('/admin');
              } else {
                navService.pushNamed('/user');
              }
            }
            return MaterialApp(
              onGenerateRoute: _routes(),
              title: 'edir',
              navigatorKey: NavigationService.navigationKey,
              // home: SplashPage(),
              darkTheme: _dark,
              theme: _light,
              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case "/":
          screen = SplashPage();
          break;
        case "/register":
          screen = RegisterPage();
          break;
        case "/login":
          screen = SignInPage();
          break;
        case "/admin":
          screen = AdminHomePage();
          break;
        case "/user":
          screen = UserDashboardPage();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
