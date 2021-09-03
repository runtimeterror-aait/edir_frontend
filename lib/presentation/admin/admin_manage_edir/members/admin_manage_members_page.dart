import 'package:edir/presentation/core/appbar.dart';
import 'package:edir/presentation/core/styles.dart';
import 'package:flutter/material.dart';

class AdminManageMembersPage extends StatelessWidget with Styles {
  AdminManageMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pending Approval",
                    style: textStyle_2,
                  ),
                  Divider(
                    height: 50,
                    color: Colors.amber,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pending Approval",
                    style: textStyle_2,
                  ),
                  Divider(
                    height: 50,
                    color: Colors.amber,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          children: [],
                        )
                      ],
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
