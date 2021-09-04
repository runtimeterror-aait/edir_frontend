import 'package:edir/presentation/core/appbar.dart';
import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with SignInAndRegisterForm {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarSection(
        title: "Profile",
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
                    backgroundImage:
                        AssetImage('assets/images/business_man.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Phone number',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white)),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Update Profile"),
                    style: raisedButtonStyle,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Delete Account"),
                      style: raisedButtonStyle.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red))),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
