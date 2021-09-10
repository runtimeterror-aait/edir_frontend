import 'package:edir/admin/bloc/admin_payment_bloc.dart';
import 'package:edir/admin/screens/admin_manage_edir/payment/admin_member_payment_page.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/models/payment.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AdminAddPaymentPage extends StatefulWidget {
  const AdminAddPaymentPage({Key? key, required this.memberId})
      : super(key: key);
  final int memberId;
  @override
  _AdminAddPaymentPageState createState() => _AdminAddPaymentPageState();
}

class _AdminAddPaymentPageState extends State<AdminAddPaymentPage>
    with SignInAndRegisterForm {
  final TextStyle inputTextStyle = TextStyle(color: Colors.white70);
  DateTime? selectedDate;
  bool pickedADate = false;
  bool redCalendar = false;

  String get showDate => DateFormat('EEEE, d MMM, yyyy').format(selectedDate!);
  TextEditingController _paymentFieldController = TextEditingController();
  TextEditingController _paymentNoteFieldController = TextEditingController();
  final _paymentFormKey = GlobalKey<FormState>();
  String validationStringPayment = "validate";
  String validationStringPaymentNote = "validate";
  String calendarMessage = "PICK A DATE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarSection(
        title: "Add Payment",
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(paymentPageWave),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            child: Form(
              key: _paymentFormKey,
              // Main Column
              child: Column(
                children: [
                  // Element one
                  TextFormField(
                    controller: _paymentFieldController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      this.validationStringPayment = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                  // Element two
                  TextFormField(
                    controller: _paymentNoteFieldController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      this.validationStringPaymentNote = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                  // Element three
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
                          pickedADate ? showDate : calendarMessage,
                          style: TextStyle(
                            color: redCalendar ? Colors.red : Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate the form inputs here
                            if (selectedDate == null) {
                              setState(() {
                                this.calendarMessage = "please pick a date";
                                this.redCalendar = true;
                              });
                            }

                            if (_paymentFormKey.currentState!.validate() &&
                                selectedDate != null) {
                              Payment payment = Payment(
                                  note: _paymentNoteFieldController.text,
                                  payment: double.parse(
                                      _paymentFieldController.text),
                                  memberId: widget.memberId,
                                  paymentDate: selectedDate!);
                              print(widget.memberId);
                              BlocProvider.of<AdminPaymentBloc>(context).add(
                                AddPaymentEvent(
                                    memberId: widget.memberId,
                                    payment: payment),
                              );

                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Post",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.amber),
                          ),
                        ),
                      )
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
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        pickedADate = true;
        redCalendar = false;
      });
    }
  }
}
