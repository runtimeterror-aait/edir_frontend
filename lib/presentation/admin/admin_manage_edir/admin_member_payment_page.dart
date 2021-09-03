import 'package:edir/presentation/admin/admin_manage_edir/admin_add_payment_page.dart';
import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:edir/presentation/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class AdminMemberPaymentPage extends StatefulWidget {
  const AdminMemberPaymentPage({Key? key}) : super(key: key);

  @override
  _AdminMemberPaymentPage createState() => _AdminMemberPaymentPage();
}

class _AdminMemberPaymentPage extends State<AdminMemberPaymentPage>
    with Styles {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        title: Text(
          "User name",
          style: TextStyle(
            color: Colors.black87,
          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminAddPaymentPage(),
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
                  top: Radius.circular(15),
                ),
              ),
              child: ListView(
                children: [
                  for (int i = 0; i < 10; i++)
                    _MemberPayment(
                      moneyAmount: 100,
                      paymentNote: "paymentNote paymentNote paymentNote",
                      selectedDate: DateTime.now(),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberPayment extends StatelessWidget with Styles {
  _MemberPayment(
      {Key? key,
      required this.moneyAmount,
      required this.paymentNote,
      required this.selectedDate})
      : super(key: key);
  int moneyAmount;
  String paymentNote;
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
                size: 24,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.amber,
                  size: 24,
                ))
          ],
        ),
        Divider(
          color: Colors.amber,
          height: 40,
        )
      ],
    );
  }
}
