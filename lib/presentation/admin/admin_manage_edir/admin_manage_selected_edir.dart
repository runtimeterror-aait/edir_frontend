import 'package:edir/presentation/core/signin_and_register_form.dart';
import 'package:flutter/material.dart';

class AdminManageSelectedEdir extends StatefulWidget {
  const AdminManageSelectedEdir({Key? key}) : super(key: key);

  @override
  _AdminManageSelectedEdirState createState() =>
      _AdminManageSelectedEdirState();
}

class _AdminManageSelectedEdirState extends State<AdminManageSelectedEdir>
    with SignInAndRegisterForm {
  List<String> _paymentTypes = [
    "Payment frequency",
    "Weekly",
    "Monthly",
    "Yearly"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
          title: Text("Edir name"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            )
          ],
        ),
        body: Column(
          children: [
            Form(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                margin: const EdgeInsets.only(top: 90),
                child: Column(
                  children: [
                    Center(
                        child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(logoImageWithoutName),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Edir Name',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Initial Deposit",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        suffix: Text('ETB'),
                        border: OutlineInputBorder(),
                      ),
                      autocorrect: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      itemHeight: 60,
                      hint: Text(
                        "Payment frequency",
                      ),
                      items: _paymentTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (e) {
                        /* Don't forget changing the value too */
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: raisedButtonStyle.copyWith(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red)),
                        onPressed: () {},
                        child: const Text('Sign in'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
