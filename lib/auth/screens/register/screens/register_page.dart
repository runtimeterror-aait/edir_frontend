import 'package:edir/auth/bloc/auth_bloc.dart';
import 'package:edir/auth/data_provider/data_provider.dart';
import 'package:edir/auth/repository/auth_repository.dart';
import 'package:edir/auth/screens/register/screens/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  AuthRepository authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(authRepository: authRepository),
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
