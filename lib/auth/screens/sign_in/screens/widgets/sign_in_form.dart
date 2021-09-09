import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _login = {};
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: ListView(
            children: [
              SizedBox(height: 30),
              Center(
                  child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(logoImage),
              )),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                onSaved: (value) {
                  this._login["email"] = value;
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.amber[300],
                    ),
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Colors.white, fontSize: fontSize)),
                autocorrect: false,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (value) {
                  this._login["full_name"] = value;
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.amber[300],
                    ),
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Colors.white, fontSize: fontSize)),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  final form = _formKey.currentState;

                  if (form != null && form.validate()) {
                    form.save();
                    print(form.toString());
                    form.reset();
                  }
                },
                child: const Text('Sign in'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.grey[200],
                      ),
                      label: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
