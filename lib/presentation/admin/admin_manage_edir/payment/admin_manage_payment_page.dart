import 'package:edir/presentation/admin/admin_manage_edir/payment/admin_member_payment_page.dart';
import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:edir/presentation/core/styles.dart';
import 'package:flutter/material.dart';

class AdminManagePaymentPage extends StatefulWidget {
  const AdminManagePaymentPage({Key? key}) : super(key: key);

  @override
  _AdminManagePaymentPageState createState() => _AdminManagePaymentPageState();
}

class _AdminManagePaymentPageState extends State<AdminManagePaymentPage>
    with Styles, SignInAndRegisterForm {
  List<String> members = [
    "Abera",
    "Abebe",
    "Bekele",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                suffix: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                labelText: 'Email or username',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              autocorrect: false,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Members",
            style: textStyle_2.copyWith(color: Colors.amber),
          ),
          Divider(
            height: 70,
            color: Colors.amber,
          ),
          Expanded(
            child: ListView(
              children: [
                for (String member in members)
                  _PaymentMembers(memberName: member),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PaymentMembers extends StatelessWidget with SignInAndRegisterForm {
  _PaymentMembers({Key? key, required this.memberName}) : super(key: key);
  final String memberName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$memberName"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminMemberPaymentPage()));
              },
              icon: Icon(Icons.add),
              label: Text("Add payment"),
              style: raisedButtonStyle,
            )
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
