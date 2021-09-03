import 'package:edir/presentation/core/styles.dart';
import 'package:flutter/material.dart';

class UserDashboardEventsCard extends StatelessWidget with Styles {
  UserDashboardEventsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.amber)),
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Edir Name",
                              style: textStyle_3.copyWith(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.black87)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "New event Posted",
                          style: textStyle_2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "We will have this event at this time.We will have this event at this time.")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
