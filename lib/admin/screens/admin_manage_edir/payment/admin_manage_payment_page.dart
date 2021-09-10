import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/screens/admin_manage_edir/payment/admin_member_payment_page.dart';
import 'package:edir/core/models/member.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminManagePaymentPage extends StatefulWidget {
  AdminManagePaymentPage({Key? key}) : super(key: key);

  @override
  _AdminManagePaymentPageState createState() => _AdminManagePaymentPageState();
}

class _AdminManagePaymentPageState extends State<AdminManagePaymentPage>
    with Styles, SignInAndRegisterForm {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<AdminMemberBloc>(context).add(GetAllMembersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text(
                "Members",
                style: textStyle_2.copyWith(color: Colors.amber),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<AdminMemberBloc>(context)
                        .add(GetAllMembersEvent());
                  },
                  icon: Icon(Icons.refresh, color: Colors.amber))
            ],
          ),
          Divider(
            height: 70,
            color: Colors.amber,
          ),
          Expanded(
            child: BlocBuilder<AdminMemberBloc, AdminMemberState>(
              builder: (context, state) {
                print(state);
                if (state is MemberLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                }

                if (state is AllMembersLoadedState) {
                  List<Member> members = state.members;

                  if (members.length == 0) {
                    return Center(
                      child: Text(
                        "No members.",
                      ),
                    );
                  }
                  return ListView(
                    padding: const EdgeInsets.all(10),
                    children: [
                      for (int i = members.length - 1; i >= 0; i--)
                        if (state.members[i].status == "a")
                          _PaymentMembers(
                            memberName: "${state.members[i].user.fullName}",
                            memberId: state.members[i].id,
                          ),
                    ],
                  );
                }
                return Center(
                  child: Text(
                    "Couldn't fetch members.",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _PaymentMembers extends StatefulWidget {
  _PaymentMembers({Key? key, required this.memberName, required this.memberId})
      : super(key: key);
  final String memberName;
  final int memberId;

  @override
  State<_PaymentMembers> createState() => _PaymentMembersState();
}

class _PaymentMembersState extends State<_PaymentMembers>
    with SignInAndRegisterForm {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.memberName}"),
            ElevatedButton.icon(
              onPressed: () {
                var state = BlocProvider.of<AdminMemberBloc>(context).state;

                BlocProvider.of<AdminPaymentBloc>(context)
                    .add(GetAllPaymentsEvent(memberId: widget.memberId));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminMemberPaymentPage(
                      memberId: widget.memberId,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text("Add payment"),
              style: raisedButtonStyleNormal,
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
