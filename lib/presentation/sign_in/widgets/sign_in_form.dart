import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.amber,
      minimumSize: Size(50, 45),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
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
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            autocorrect: false,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 20,
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
