import 'package:edir/auth/bloc/user_bloc.dart';
import 'package:edir/auth/bloc/user_state.dart';
import 'package:edir/auth/bloc/user_event.dart';
import 'package:edir/auth/models/addMember.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:edir/core/signin_and_register_form.dart';

class JoinEdirForm extends StatelessWidget with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _member = {};
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is JoinEdirLoaded) {
          navService.pushReplacementNamed("/user");
        }

        if (state is JoinEdirError) {
          _showToast(context, "Error joining please try again");
        }
      },
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/images/edir_logo.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        this._member["username"] = value;
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please enter edir username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Edir Username',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;

                          if (form != null && form.validate()) {
                            form.save();

                            var member = AddMember(
                              edirUsername: this._member['username'],
                              status: "s",
                              userId: 1,
                            );

                            BlocProvider.of<UserBloc>(context)
                                .add(JoinEdir(member));
                          }
                        },
                        child: Text("Join Edir"),
                        style: raisedButtonStyle,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
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
