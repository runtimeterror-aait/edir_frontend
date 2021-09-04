import 'package:edir/screens/core/styles.dart';
import 'package:edir/screens/admin/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with Styles {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        leading: Image.asset('assets/images/edir_logo.png'),
        actions: <Widget>[
          Image.asset('assets/images/business_man.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            DashboardCard(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Your Edirs",
                    style: textStyle_2,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Edir name"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.people_alt),
                                    label: Text("100 Members"),
                                    style: roundedElevatedButtonStyle,
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Manage",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Edir name"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.people_alt),
                                    label: Text("100 Members"),
                                    style: roundedElevatedButtonStyle,
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Manage",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
