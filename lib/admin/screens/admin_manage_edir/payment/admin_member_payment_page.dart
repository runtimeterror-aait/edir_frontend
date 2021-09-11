import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/screens/admin_manage_edir/payment/admin_add_payment_page.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/models/payment.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminMemberPaymentPage extends StatefulWidget {
  const AdminMemberPaymentPage({Key? key, required this.memberId})
      : super(key: key);
  final int memberId;

  @override
  _AdminMemberPaymentPage createState() => _AdminMemberPaymentPage();
}

class _AdminMemberPaymentPage extends State<AdminMemberPaymentPage>
    with Styles {
  IconButton actionsSettingButton = IconButton(
    onPressed: () {},
    icon: Icon(
      Icons.settings,
      color: Colors.black,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
          title: "Edir name", actions: [actionsSettingButton], elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminAddPaymentPage(
                memberId: widget.memberId,
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/payment_page_wave.png',
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text("User Name", style: textStyle_2),
          ),
          Expanded(
            child: Container(
              // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: BlocBuilder<AdminPaymentBloc, AdminPaymentState>(
                builder: (context, state) {
                  if (state is PaymentsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  } else if (state is AllPaymentsLoadedState) {
                    List<Payment> payments = state.payments;
                    if (payments.length == 0) {
                      return Center(
                        child: Text("No payment from this user so far."),
                      );
                    }
                    return ListView(
                      children: [
                        for (int i = payments.length - 1; i >= 0; i--)
                          MemberPayment(
                            moneyAmount: payments[i].payment,
                            paymentNote: payments[i].note,
                            selectedDate: payments[i].paymentDate,
                            isAdmin: true,
                          )
                      ],
                    );
                  }

                  print(widget.memberId);
                  print(state);
                  return Center(
                      child: Text(
                    "Couldn't fetch payments",
                    style: TextStyle(color: Colors.red),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MemberPayment extends StatelessWidget with Styles {
  MemberPayment({
    Key? key,
    required this.moneyAmount,
    required this.paymentNote,
    required this.selectedDate,
    required this.isAdmin,
  }) : super(key: key);
  final double moneyAmount;
  final bool isAdmin;
  final String paymentNote;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ETB $moneyAmount",
                    style: textStyle_2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "$paymentNote",
                      style: textStyle_0,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      selectedDate.toString(),
                      style: textStyle_0,
                    ),
                  ),
                ],
              ),
              Spacer(),
              if (isAdmin)
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 24,
                  ),
                )
            ],
          ),
        ),
        Divider(
          color: Colors.amber,
          height: 40,
        )
      ],
    );
  }
}
