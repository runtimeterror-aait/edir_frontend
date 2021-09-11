import 'package:edir/core/appbar.dart';
import 'package:edir/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class JoinEdirPage extends StatefulWidget {
  const JoinEdirPage({Key? key}) : super(key: key);

  @override
  _JoinEdirPageState createState() => _JoinEdirPageState();
}

class _JoinEdirPageState extends State<JoinEdirPage>
    with SignInAndRegisterForm {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarSection(
        title: "Join Edir",
      ),
      body: Column(
        children: [
          Form(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/edir_logo.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Edir Username',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Join Edir"),
                    style: raisedButtonStyle,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
