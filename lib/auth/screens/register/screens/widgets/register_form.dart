import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//RegisterForm implements formWidget (Returns 'Register' Widget.)
class RegisterForm extends StatelessWidget with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};
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
                  this._user["full_name"] = value;
                },
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white)),
                autocorrect: false,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (value) {
                  this._user["email"] = value;
                },
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white)),
                autocorrect: false,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (value) {
                  this._user["phone"] = value;
                },
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Phone number',
                    labelStyle: TextStyle(color: Colors.white)),
                autocorrect: false,
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                onSaved: (value) {
                  this._user["password"] = value;
                },
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white)),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  //signup here
                  final form = _formKey.currentState;
                  if (form != null) {
                    form.save();
                    print(this._user);

                    BlocProvider.of<AuthBloc>(context).add(SignUp(
                      User(
                        id: null,
                        full_name: this._user['full_name'],
                        email: this._user['email'],
                        phone: this._user['phone'],
                        password: this._user['password'],
                        role: "a",
                      ),
                    ));
                  }
                },
                child: const Text('Register'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    icon: Icon(
                      Icons.login,
                      color: Colors.grey[200],
                    ),
                    label: const Text(
                      'Already Have Account',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
