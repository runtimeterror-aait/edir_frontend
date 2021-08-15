import 'package:edir_frontend/presentation/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

//RegisterForm implements formWidget (Returns 'Register' Widget.)
class RegisterForm extends SignInAndRegisterForm {
  Widget get formWidget => Register(
        raisedButtonStyle: raisedButtonStyle,
        fontSize: fontSize,
      );
}

class Register extends StatelessWidget {
  const Register(
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
                isDense: true,
                labelText: 'Full Name',
                labelStyle: TextStyle(color: Colors.white)),
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
                isDense: true,
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white)),
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
                isDense: true,
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white)),
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
                isDense: true,
                labelText: 'Phone number',
                labelStyle: TextStyle(color: Colors.white)),
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
            child: const Text('Register'),
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
                  'SIGN UP WITH GOOGLE',
                  style: TextStyle(color: Colors.grey),
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.login,
                  color: Colors.grey[200],
                ),
                label: const Text(
                  'SIGN IN',
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
