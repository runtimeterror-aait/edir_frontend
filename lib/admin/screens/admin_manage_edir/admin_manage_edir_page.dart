import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/data_provider/admin_members_data_provider.dart';
import 'package:edir/admin/repository/admin_event_repository.dart';
import 'package:edir/admin/repository/admin_members_repository.dart';
import 'package:edir/admin/screens/admin_manage_edir/home/admin_home_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/members/admin_manage_members_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/payment/admin_manage_payment_page.dart';
import 'package:edir/admin/screens/create_edir/widgets/create_edir_form.dart';
import 'package:edir/admin/screens/dashboard/widgets/dashboard_card.dart';
import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/bloc/auth_state.dart';
import 'package:edir/auth/repository/auth_repository.dart';
import 'package:edir/auth/screens/register/screens/register_page.dart';
import 'package:edir/auth/screens/register/screens/widgets/register_form.dart';
import 'package:edir/auth/screens/sign_in/screens/sign_in_page.dart';
import 'package:edir/auth/screens/sign_in/screens/widgets/sign_in_form.dart';
import 'package:edir/splash/screens/splash_page.dart';
import 'package:edir/splash/screens/widgets/splash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class AdminManageEdirPage extends StatefulWidget {
  AdminManageEdirPage({Key? key}) : super(key: key);

  @override
  _AdminManageEdirPageState createState() => _AdminManageEdirPageState();
}

class _AdminManageEdirPageState extends State<AdminManageEdirPage> {
  final List<Widget> _pages = [
    AdminHomePage(),
    AdminManagePaymentPage(),
    AdminManageMembersPage(),
  ];

  int _selectedPage = 0;

  void _onTapChangePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  AuthRepository authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(GetLoggedInUser()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // if (state is LoggedInUser) {
          //   var user = state.login;
          //   if (user.role == "a") {
          //     navService.pushNamed('/admin');
          //   }
          // }
          // if (state is NotLoggedInUser) {
          //   navService.pushNamed("/login");
          // }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Metebaber",
              style: TextStyle(color: Colors.black87),
            ),
            backgroundColor: Colors.amber,
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: "Members"),
              ],
              elevation: 10,
              currentIndex: _selectedPage,
              selectedItemColor: Colors.amber,
              backgroundColor: Colors.black26,
              onTap: _onTapChangePage),
        ),
      ),
    );
  }
}
