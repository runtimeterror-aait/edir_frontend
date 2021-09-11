import 'package:edir/admin/bloc/admin_edir_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEdirForm extends StatelessWidget with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _edir = {};

  CreateEdirForm({Key? key}) : super(key: key);

  List<String> _paymentTypes = [
    "Payment frequency",
    "Weekly",
    "Monthly",
    "Yearly"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminEdirBloc, AdminEdirState>(
      listener: (context, state) {
        print(state);
      },
      child: Form(
        key: _formKey,
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
              onSaved: (value) {
                this._edir["name"] = value;
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter your edir name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              onSaved: (value) {
                this._edir["username"] = value;
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter your edir username';
                }
                return null;
              },
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
              onSaved: (value) {
                this._edir["initial_deposit"] = value;
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter your edir initial deposit';
                }
                return null;
              },
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
              items:
                  _paymentTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (e) {
                this._edir['payment_frequency'] = e.toString();
              },
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form != null && form.validate()) {
                  form.save();
                  print(this._edir);
                  Edir edir = Edir(
                      id: null,
                      name: this._edir["name"],
                      initialDeposit:
                          double.parse(this._edir["initial_deposit"]),
                      ownerId: null,
                      paymentFrequency: this._edir["payment_frequency"],
                      username: this._edir["username"]);
                  BlocProvider.of<AdminEdirBloc>(context)
                      .add(CreateEdirEvent(edir: edir));
                }
              },
              child: const Text("Create"),
              style: raisedButtonStyle,
            )
          ],
        ),
      ),
    );
  }
}
