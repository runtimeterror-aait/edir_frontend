import 'package:edir/admin/bloc/admin_member_bloc.dart';
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
import 'package:edir/auth/screens/sign_in/screens/sign_in_page.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/models/payment.dart';
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

  double totalPayment = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
            BlocProvider.of<AdminPaymentBloc>(context)
                .add(GetMemberPaymentsEvent());
          },
          child: BlocProvider(
            create: (context) =>
                UserBloc(userRepository: userRepository)..add(JoinedEdir()),
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is JoinEdirFetchError) {
                  navService.pushReplacementNamed("/join_edir");
                }

                if (state is JoinEdirFetchLoaded) {
                  print(state.member.edirId);
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.amber,
                  title: Text("Welcome", style: TextStyle(color: Colors.black)),
                  leading: Image.asset(logoImageWithoutName),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(LogOut());
                        if (BlocProvider.of<AuthBloc>(context).state
                            is LogoutSucess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
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
                  children: [
                    UserDashboardEventsCard(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total Payments",
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "ETB $totalPayment",
                                    style: textStyleBold_3,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AdminPaymentBloc>(context)
                                        .add(GetMemberPaymentsEvent());
                                  },
                                  icon:
                                      Icon(Icons.refresh, color: Colors.amber))
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
                        child: BlocBuilder<AdminPaymentBloc, AdminPaymentState>(
                          builder: (context, state) {
                            if (state is PaymentsLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              );
                            }
                            if (state is GetMemberPaymentsState) {
                              List<Payment> payments = state.payments;
                              for (int i = payments.length - 1; i >= 0; i--) {
                                totalPayment += payments[i].payment;
                              }
                              if (payments.length == 0) {
                                return Center(
                                  child: Text("No payment information."),
                                );
                              }
                              return ListView(
                                children: [
                                  for (int i = payments.length - 1; i >= 0; i--)
                                    MemberPayment(
                                        moneyAmount: payments[i].payment,
                                        paymentNote: payments[i].note,
                                        selectedDate: payments[i].paymentDate,
                                        isAdmin: false),
                                ],
                              );
                            }
                            return Center(
                              child: Text("Couldn't fetch payments"),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
