import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.amber[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Form(
        child: ListView(
      children: [
        Center(
          child: Text(
            'Edir',
            style: TextStyle(fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
          ),
          autocorrect: false,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password',
          ),
          autocorrect: false,
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {},
                child: const Text('Sign in'),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
