import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminAddPaymentPage extends StatefulWidget {
  const AdminAddPaymentPage({Key? key}) : super(key: key);

  @override
  _AdminAddPaymentPageState createState() => _AdminAddPaymentPageState();
}

class _AdminAddPaymentPageState extends State<AdminAddPaymentPage>
    with SignInAndRegisterForm {
  final TextStyle inputTextStyle = TextStyle(color: Colors.white70);
  DateTime selectedDate = DateTime.now();
  bool pickedADate = false;
  String get showDate => DateFormat('EEEE, d MMM, yyyy').format(selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Payment"),
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(paymentPageWave),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.note,
                          color: Colors.amber,
                        ),
                        labelText: 'Payment Note',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.payment,
                        color: Colors.amber,
                      ),
                      labelText: "Payment",
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: fontSize),
                      suffix: Text('ETB'),
                      border: OutlineInputBorder(),
                    ),
                    autocorrect: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          _datePicker(context);
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.amber,
                        ),
                        label: Text(
                          pickedADate ? showDate : "PICK A DATE",
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _datePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        pickedADate = true;
      });
    }
  }
}
