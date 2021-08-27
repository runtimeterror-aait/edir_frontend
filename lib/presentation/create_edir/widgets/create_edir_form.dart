import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class CreateEdirForm extends StatelessWidget with SignInAndRegisterForm {
  CreateEdirForm({Key? key}) : super(key: key);

  List<String> _paymentTypes = [
    "Payment frequency",
    "Weekly",
    "Monthly",
    "Yearly"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Edir Name",
              labelStyle: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
            autocorrect: false,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Edir Username",
              labelStyle: TextStyle(color: Colors.white, fontSize: fontSize),
              border: OutlineInputBorder(),
            ),
            autocorrect: false,
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Initial Deposit",
              labelStyle: TextStyle(color: Colors.white, fontSize: fontSize),
              suffix: Text('ETB'),
              border: OutlineInputBorder(),
            ),
            autocorrect: false,
          ),
          const SizedBox(
            height: 25,
          ),
          DropdownButton(
            isExpanded: true,
            itemHeight: 60,
            hint: Text(
              "Payment frequency",
            ),
            items: _paymentTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (e) {
              /* Don't forget changing the value too */
            },
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Create"),
            style: raisedButtonStyle,
          )
        ],
      ),
    );
  }
}
