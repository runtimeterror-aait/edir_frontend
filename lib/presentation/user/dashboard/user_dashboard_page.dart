import 'package:edir/presentation/core/appbar.dart';
import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:edir/presentation/user/dashboard/widgets/user_dashboard_events_card.dart';
import 'package:flutter/material.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage>
    with SignInAndRegisterForm {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        title: Text("Welcome USER"),
        leading: Image.asset(logoImageWithoutName),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Image.asset('assets/images/business_man.png'),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          UserDashboardEventsCard(),
          Spacer(),
        ],
      ),
    );
  }
}
