import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/screens/admin_manage_edir/payment/admin_member_payment_page.dart';
import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/bloc/auth_state.dart';
import 'package:edir/auth/bloc/user_bloc.dart';
import 'package:edir/auth/bloc/user_state.dart';
import 'package:edir/auth/bloc/user_event.dart';
import 'package:edir/auth/repository/auth_repository.dart';
import 'package:edir/auth/repository/user_repository.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/core/styles.dart';
import 'package:edir/user/screens/dashboard/widgets/user_dashboard_events_card.dart';
import 'package:edir/user/screens/profile/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

final AuthRepository authRepository = AuthRepository();

class _UserDashboardPageState extends State<UserDashboardPage>
    with SignInAndRegisterForm, Styles {
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(GetLoggedInUser()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedInUser) {
            var user = state.login;
            if (user.role == "a") {
              navService.pushNamed('/admin');
            }
          }

          if (state is NotLoggedInUser) {
            navService.pushNamed("/login");
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.amber,
            title: Text(
              "Welcome",
              style: TextStyle(color: Colors.black),
            ),
            leading: Image.asset(logoImageWithoutName),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfilePage()));
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
                  ],
                ),
              ),
              Divider(
                height: 30,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: BlocBuilder<AdminPaymentBloc, AdminPaymentState>(
                  builder: (context, state) {
                    return ListView(
                      children: [
                        // for (int i = 0; i < 10; i++)
                        //   MemberPayment(
                        //     moneyAmount: 100,
                        //     paymentNote: "payment note",
                        //     selectedDate: DateTime.now(),
                        //     isAdmin: false,
                        //   ),
                      ],
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  // void _joinEdirDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => SimpleDialog(
  //       title: Text('Join Edir'),
  //       children: [
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Form(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: [
  //               TextFormField(
  //                 decoration: InputDecoration(
  //                     isDense: true, labelText: "Edir username"),
  //               ),
  //               SizedBox(
  //                 height: 15,
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {},
  //                 child: Text("Join"),
  //                 style: raisedButtonStyleNormal,
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //       contentPadding: const EdgeInsets.all(10),
  //     ),
  //   );
  // }
}
