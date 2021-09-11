import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/bloc/admin_member_bloc.dart';
import 'package:edir/auth/bloc/bloc.dart';
import 'package:edir/core/models/event.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserDashboardEventsCard extends StatefulWidget with Styles {
  UserDashboardEventsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<UserDashboardEventsCard> createState() =>
      _UserDashboardEventsCardState();
}

class _UserDashboardEventsCardState extends State<UserDashboardEventsCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AdminEventBloc>(context).add(GetAllMemberEventsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Scrollbar(
          child: Container(
            height: 300,
            child: BlocBuilder<AdminEventBloc, AdminEventState>(
              builder: (context, state) {
                if (state is LoadingMemberEventsState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  );
                } else if (state is AllMemberEventsLoadedState) {
                  List<Event> events = state.events;
                  if (state.events.length != 0) {
                    Center(
                      child: Text("No new event."),
                    );
                  }

                  return ListView(
                    controller: ScrollController(keepScrollOffset: false),
                    padding: const EdgeInsets.all(5),
                    children: [
                      for (int i = events.length - 1; i >= 0; i--)
                        _EventsContainer(
                          eventTitle: events[i].title,
                          eventDescription: events[i].description,
                          dateTime: events[i].eventDate,
                        )
                    ],
                  );
                }
                return Center(
                  child: Text("Couldn't fetch events"),
                );
              },
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
    required this.eventTitle,
    required this.eventDescription,
    required this.dateTime,
  }) : super(key: key);

  final String eventTitle;
  final String eventDescription;
  final DateTime dateTime;

  String get date => DateFormat('EEEE, d MMM, yyyy').format(dateTime);

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
                        eventTitle,
                        style: textStyle_3.copyWith(
                            color: MaterialStateColor.resolveWith(
                                (states) => Colors.blueGrey)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    eventDescription,
                    style: TextStyle(
                      color: MaterialStateColor.resolveWith(
                          (states) => Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: MaterialStateColor.resolveWith(
                          (states) => Colors.black87),
                    ),
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
