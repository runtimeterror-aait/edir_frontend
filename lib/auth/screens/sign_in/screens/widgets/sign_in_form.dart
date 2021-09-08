import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget with SignInAndRegisterForm {
  @override
  Widget build(BuildContext context) {
    return Form(
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
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.amber[300],
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white, fontSize: fontSize)),
            autocorrect: false,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
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
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {},
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
