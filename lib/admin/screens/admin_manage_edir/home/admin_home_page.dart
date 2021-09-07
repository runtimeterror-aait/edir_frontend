import 'dart:convert';

import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/screens/admin_manage_edir/admin_manage_edir_page.dart';
import 'package:edir/admin/screens/admin_manage_edir/home/admin_manage_selected_edir.dart';
import 'package:edir/admin/screens/admin_manage_edir/widgets/create_event_card.dart';
import 'package:edir/core/models/event.dart';
import 'package:edir/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> with Styles {
  @override
  void initState() {
    super.initState();
    _loadAllEvents();
  }

  _loadAllEvents() async {
    BlocProvider.of<AdminEventBloc>(context).add(GetAllEventsEvent(2));
  }

  @override
  Widget build(BuildContext context) {
    ScrollController? _controller;
    final AdminEventBloc adminEventBloc =
        BlocProvider.of<AdminEventBloc>(context);
    return Column(
      children: [
        SizedBox(height: 20),
        CreateEventCard(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  Text(
                    "Event name",
                    style: textStyle_2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<AdminEventBloc, AdminEventState>(
                      builder: (BuildContext context, AdminEventState state) {
                    if (state is EventLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      );
                    } else if (state is AllEventsLoadedState) {
                      List<Event> events = state.events;
                      if (events.length == 0) {
                        return Center(
                          child: Text("No events yet."),
                        );
                      }
                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: events.length,
                          itemBuilder: (_, id) => _ManageableEvents(
                            eventTitle: '${events.elementAt(id).title}',
                            eventId: events.elementAt(id).id!,
                            event: events.elementAt(id),
                          ),
                        ),
                      );
                    }

                    return Text("Couldn't fetch events.");
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ManageableEvents extends StatefulWidget {
  _ManageableEvents(
      {Key? key,
      required this.eventTitle,
      required this.eventId,
      required this.event})
      : super(key: key);
  String eventTitle;
  int eventId;
  Event event;
  @override
  __ManageableEventsState createState() => __ManageableEventsState();
}

class __ManageableEventsState extends State<_ManageableEvents> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("${widget.eventTitle}"),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminManageSelectedEdir()),
                );
              },
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
            ),
            IconButton(
              onPressed: () {
                print("edir id: ${widget.eventId}");

                BlocProvider.of<AdminEventBloc>(context).add(
                  DeleteEvent(widget.eventId, widget.event.edirId),
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
        Divider(
          height: 25,
        )
      ],
    );
  }
}
