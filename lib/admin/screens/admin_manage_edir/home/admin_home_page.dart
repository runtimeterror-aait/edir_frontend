import 'dart:convert';

import 'package:edir/admin/screens/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/home/admin_manage_selected_edir.dart';
import 'package:edir/admin/screens/admin_manage_edir/widgets/create_event_card.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget with Styles {
  AdminHomePage({Key? key}) : super(key: key);

  List edirNames = [
    "Metebaber",
    "Andinet",
    "Hibret",
    "Metebaber",
    "Andinet",
    "Hibret",
    "Metebaber",
    "Andinet",
    "Hibret",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSection(
        title: "Home page",
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CreateEventCard(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Text(
                      "Edir name",
                      style: textStyle_2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (String edir in edirNames)
                      _ManageableEdirs(edirName: edir.toUpperCase())
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ManageableEdirs extends StatelessWidget {
  _ManageableEdirs({
    Key? key,
    required this.edirName,
  }) : super(key: key);
  String edirName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("$edirName"),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminManageSelectedEdir()),
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
        Divider(
          height: 25,
        )
      ],
    );
  }
}
