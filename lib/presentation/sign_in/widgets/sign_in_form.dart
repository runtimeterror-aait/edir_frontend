import 'package:edir_frontend/presentation/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class SignInForm extends SignInAndRegisterForm {
  @override
  Widget get formWidget => SignIn(
        raisedButtonStyle: raisedButtonStyle,
        fontSize: fontSize,
      );
}

class SignIn extends StatelessWidget {
  const SignIn(
      {Key? key, required this.raisedButtonStyle, required this.fontSize})
      : super(key: key);
  final ButtonStyle raisedButtonStyle;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        SizedBox(height: 30),
        Center(
            child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/edir_logo.png'),
        )),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.amber[300],
                ),
                labelText: 'Email or username',
                labelStyle: TextStyle(color: Colors.white, fontSize: fontSize)),
            autocorrect: false,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.amber[300],
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white, fontSize: fontSize)),
            autocorrect: false,
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
            child: const Text('Sign in'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.email,
                  color: Colors.grey[200],
                ),
                label: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(color: Colors.grey),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.person_add,
                  color: Colors.grey[200],
                ),
                label: const Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )),
          ],
        ),
      ],
    ));
  }
}
