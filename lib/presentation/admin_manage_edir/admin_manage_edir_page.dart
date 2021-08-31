import 'package:edir/presentation/admin_manage_edir/admin_home_page.dart';
import 'package:edir/presentation/create_edir/widgets/create_edir_form.dart';
import 'package:edir/presentation/dashboard/widgets/dashboard_card.dart';
import 'package:edir/presentation/register/register_page.dart';
import 'package:edir/presentation/register/widgets/register_form.dart';
import 'package:edir/presentation/sign_in/sign_in_page.dart';
import 'package:edir/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:edir/presentation/splash/splash_page.dart';
import 'package:edir/presentation/splash/widgets/splash_card.dart';
import 'package:flutter/material.dart';

class AdminManageEdirPage extends StatefulWidget {
  AdminManageEdirPage({Key? key}) : super(key: key);

  @override
  _AdminManageEdirPageState createState() => _AdminManageEdirPageState();
}

class _AdminManageEdirPageState extends State<AdminManageEdirPage> {
  final List<Widget> _pages = [
    AdminHomePage(),
    DashboardCard(),
    SplashCard(),
  ];

  int _selectedPage = 0;

  void _onTapChangePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Metebaber",
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: _pages[_selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "Payment"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Members"),
          ],
          elevation: 10,
          currentIndex: _selectedPage,
          selectedItemColor: Colors.amber,
          backgroundColor: Colors.black26,
          onTap: _onTapChangePage),
    );
  }
}
