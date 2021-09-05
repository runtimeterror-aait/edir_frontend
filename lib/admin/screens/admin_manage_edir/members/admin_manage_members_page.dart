import 'dart:ui';

import 'package:edir/core/appbar.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';

class AdminManageMembersPage extends StatelessWidget
    with Styles, SignInAndRegisterForm {
  AdminManageMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      // decoration: BoxDecoration(
      //   color: Colors.black12,
      // ),
      child: Column(
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pending Approval",
                  style: textStyle_2.copyWith(
                    color: MaterialStateColor.resolveWith(
                        (states) => Colors.amber),
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.amber,
                ),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView(
                      padding: const EdgeInsets.all(10),
                      children: [
                        for (int i = 0; i < 10; i++)
                          PendingApproval(memberName: "Abebe Abera"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Members",
                        style: textStyle_2.copyWith(
                          color: MaterialStateColor.resolveWith(
                              (states) => Colors.amber),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 50,
                    color: Colors.amber,
                  ),
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          for (int i = 0; i < 10; i++)
                            Members(memberName: "Abebe Abera"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PendingApproval extends StatelessWidget with SignInAndRegisterForm {
  PendingApproval({Key? key, required this.memberName}) : super(key: key);
  final String memberName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$memberName",
              style: TextStyle(color: Colors.grey.shade300),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Approve",
              ),
              style: raisedButtonStyleNormal.copyWith(
                elevation: MaterialStateProperty.resolveWith((states) => 0),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey[200]),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class Members extends StatelessWidget with SignInAndRegisterForm {
  Members({Key? key, required this.memberName}) : super(key: key);
  final String memberName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$memberName",
              style: TextStyle(color: Colors.grey.shade300),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Remove",
                style: TextStyle(color: Colors.grey[200]),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
