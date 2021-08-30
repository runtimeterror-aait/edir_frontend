import 'package:edir/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SignInForm(),
          ],
        ),
      ),
    );
  }
}
