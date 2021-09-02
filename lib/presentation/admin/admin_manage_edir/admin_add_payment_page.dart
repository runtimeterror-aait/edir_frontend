import 'package:flutter/material.dart';

class AdminAddPaymentPage extends StatefulWidget {
  const AdminAddPaymentPage({Key? key}) : super(key: key);

  @override
  _AdminAddPaymentPageState createState() => _AdminAddPaymentPageState();
}

class _AdminAddPaymentPageState extends State<AdminAddPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        title: Text(
          "Metebaber",
          style: TextStyle(color: Colors.black87),
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
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
