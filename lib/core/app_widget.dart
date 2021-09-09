import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/repository/admin_event_repository.dart';
import 'package:edir/admin/screens/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/home/admin_home_page.dart';
import 'package:edir/admin/screens/create_edir/create_edir_page.dart';
import 'package:edir/admin/screens/dashboard/dashboard_page.dart';
import 'package:edir/register/screens/register_page.dart';
import 'package:edir/register/screens/widgets/register_form.dart';
import 'package:edir/sign_in/screens/sign_in_page.dart';
import 'package:edir/splash/screens/splash_page.dart';
import 'package:edir/user/screens/dashboard/user_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  // final AdminEventRepository eventRepository =
  //     AdminEventRepository(AdminEventDataProvider());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'edir',
      home: AdminManageEdirPage(),
      darkTheme: _dark,
      theme: _light,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
