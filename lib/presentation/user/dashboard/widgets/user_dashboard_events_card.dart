import 'package:edir/presentation/core/styles.dart';
import 'package:flutter/material.dart';

class UserDashboardEventsCard extends StatelessWidget with Styles {
  UserDashboardEventsCard({
    Key? key,
  }) : super(key: key);
  List<Map> eventContainerInputs = [
    {
      "edirName": "Metebaber",
      "eventTitle": "Funeral",
      "eventDescription":
          "We will have this event at this time.We will have this event at this time. We will have this event at this time.We will have this event at this time."
    },
    {
      "edirName": "Metebaber",
      "eventTitle": "Funeral",
      "eventDescription":
          "We will have this event at this time.We will have this event at this time. We will have this event at this time.We will have this event at this time."
    },
    {
      "edirName": "Metebaber",
      "eventTitle": "Funeral",
      "eventDescription":
          "We will have this event at this time.We will have this event at this time. We will have this event at this time.We will have this event at this time."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Scrollbar(
          child: Container(
            height: 300,
            child: ListView(
              padding: const EdgeInsets.all(5),
              children: [
                for (Map eventContainer in eventContainerInputs)
                  _EventsContainer(
                      edirName: eventContainer['edirName'],
                      eventTitle: eventContainer['eventTitle'],
                      eventDescription: eventContainer['eventDescription'])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EventsContainer extends StatelessWidget with Styles {
  _EventsContainer({
    Key? key,
    required this.edirName,
    required this.eventTitle,
    required this.eventDescription,
  }) : super(key: key);

  final String edirName;
  final String eventTitle;
  final String eventDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.amber)),
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        edirName,
                        style: textStyle_3.copyWith(
                            color: MaterialStateColor.resolveWith(
                                (states) => Colors.blueGrey)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "New event Posted",
                    style: textStyle_2.copyWith(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.blueGrey)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    eventTitle,
                    style: TextStyle(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.blueGrey)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    eventDescription,
                    style: TextStyle(
                        color: MaterialStateColor.resolveWith(
                            (states) => Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
