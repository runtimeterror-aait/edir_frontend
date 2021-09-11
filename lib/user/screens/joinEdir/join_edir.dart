import 'package:edir/auth/bloc/bloc.dart';
import 'package:edir/auth/bloc/user_bloc.dart';
import 'package:edir/auth/bloc/user_state.dart';
import 'package:edir/auth/bloc/user_event.dart';
import 'package:edir/auth/models/addMember.dart';
import 'package:edir/auth/repository/user_repository.dart';
import 'package:edir/core/appbar.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:edir/user/screens/joinEdir/widgets/join_edir_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinEdirPage extends StatefulWidget {
  const JoinEdirPage({Key? key}) : super(key: key);

  @override
  _JoinEdirPageState createState() => _JoinEdirPageState();
}

class _JoinEdirPageState extends State<JoinEdirPage>
    with SignInAndRegisterForm {
  final _formKey = GlobalKey<FormState>();
  UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarSection(
          title: "Join Edir",
        ),
        body: JoinEdirForm(),
      ),
    );
  }
}
