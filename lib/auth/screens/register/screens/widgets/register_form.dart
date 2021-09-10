import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/bloc/auth_state.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//RegisterForm implements formWidget (Returns 'Register' Widget.)
class RegisterForm extends StatelessWidget with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();

  List<String> _userType = [
    "a",
    "u",
  ];

  Widget _returnUserType(String userType) {
    if (userType == "a") {
      return new Text("Edir Manager");
    } else {
      return new Text("Edir User");
    }
  }

  final Map<String, dynamic> _user = {};
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          _showToast(context, "Registred Failed");
        }
        if (state is AuthLoaded) {
          print(state.userModel.detail);
          _showToast(context, "Registred Succesfully");
        }

        if (state is AuthLoading) {
          print("loading...");
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
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
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
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
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
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
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
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
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
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
                  DropdownButton(
                    isExpanded: true,
                    itemHeight: 60,
                    hint: Text(
                      "I am",
                    ),
                    items:
                        _userType.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: _returnUserType(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      this._user['role'] = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () {
                      //signup here
                      final form = _formKey.currentState;
                      if (form != null && form.validate()) {
                        form.save();
                        BlocProvider.of<AuthBloc>(context).add(SignUp(
                          User(
                            id: null,
                            full_name: this._user['full_name'],
                            email: this._user['email'],
                            phone: this._user['phone'],
                            password: this._user['password'],
                            role: this._user['role'],
                          ),
                        ));
                        form.reset();
                        Future.delayed(const Duration(milliseconds: 3000), () {
                          Navigator.pushNamed(context, '/login');
                        });
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
      }),
    );
  }

  void _showToast(BuildContext context, String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
