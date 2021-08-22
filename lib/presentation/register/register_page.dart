import 'package:edir_frontend/presentation/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: RegisterForm(),
      ),
    );
  }
}
