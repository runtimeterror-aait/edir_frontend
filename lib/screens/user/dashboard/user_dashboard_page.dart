import 'package:edir/screens/admin/admin_manage_edir/payment/admin_member_payment_page.dart';
import 'package:edir/screens/core/appbar.dart';
import 'package:edir/screens/core/signin_and_register_form.dart';
import 'package:edir/screens/core/styles.dart';
import 'package:edir/screens/user/dashboard/widgets/user_dashboard_events_card.dart';
import 'package:edir/screens/user/profile/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage>
    with SignInAndRegisterForm, Styles {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        title: Text("Welcome USER"),
        leading: Image.asset(logoImageWithoutName),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()));
            },
            child: Image.asset('assets/images/business_man.png'),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
            child: Text("Recent events", style: textStyle_2),
          ),
          UserDashboardEventsCard(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Payments",
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "ETB 300",
                  style: textStyleBold_3,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _joinEdirDialog(context);
                      },
                      child: Text(
                        "Join Edir",
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        //
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "My Edirs",
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 30,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++)
                        MemberPayment(
                          moneyAmount: 100,
                          paymentNote: "payment note",
                          selectedDate: DateTime.now(),
                          isAdmin: false,
                        ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _joinEdirDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Join Edir'),
        children: [
          SizedBox(
            height: 10,
          ),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      isDense: true, labelText: "Edir username"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Join"),
                  style: raisedButtonStyleNormal,
                )
              ],
            ),
          )
        ],
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
