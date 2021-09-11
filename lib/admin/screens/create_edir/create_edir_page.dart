import 'package:edir/admin/bloc/admin_edir_bloc.dart';
import 'package:edir/admin/screens/create_edir/widgets/create_edir_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEdirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Edir"),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => AdminEdirBloc(),
          child: Container(
            child: Stack(
              children: [
                Image.asset('assets/images/create_edir_wave_2.png'),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  margin: const EdgeInsets.only(top: 90),
                  child: CreateEdirForm(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/create_edir_wave.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
