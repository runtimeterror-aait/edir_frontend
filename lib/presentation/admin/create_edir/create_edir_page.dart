import 'package:edir/presentation/admin/create_edir/widgets/create_edir_form.dart';
import 'package:flutter/material.dart';

class CreateEdirPage extends StatelessWidget {
  const CreateEdirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Edir"),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
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
    );
  }
}
