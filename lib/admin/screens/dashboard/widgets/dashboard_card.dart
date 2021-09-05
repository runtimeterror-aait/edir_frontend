import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({Key? key}) : super(key: key);

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> with Styles {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Analytics",
                style: textStyle_3,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: AnalyticsCard(
                    count: 5,
                    icon: Icon(Icons.money),
                    title: "Members",
                  ),
                ),
                Expanded(
                  child: AnalyticsCard(
                    count: 0,
                    icon: Icon(Icons.people),
                    title: "Members",
                  ),
                ),
                Expanded(
                  child: AnalyticsCard(
                    count: 0,
                    icon: Icon(Icons.calendar_today),
                    title: "Events",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AnalyticsCard extends StatelessWidget with Styles {
  AnalyticsCard(
      {Key? key, required this.count, required this.icon, required this.title})
      : super(key: key);
  final int count;
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$count",
                    style: textStyle_3,
                  ),
                  icon,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$title",
                style: textStyle_1,
              )
            ],
          )),
    );
  }
}
