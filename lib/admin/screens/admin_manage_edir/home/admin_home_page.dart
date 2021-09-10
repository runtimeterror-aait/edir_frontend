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
              child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<AdminEventBloc>(context)
                      .add(GetAllEventsEvent());
                },
                child: ListView(
                  children: [
                    Text(
                      "Events name",
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
                          child: Scrollbar(
                            child: ListView(children: [
                              for (var i = events.length - 1; i >= 0; i--)
                                _ManageableEvents(
                                  eventTitle: '${events[i].title}',
                                  eventId: events[i].id!,
                                  event: events[i],
                                  eventDescription: events[i].description,
                                ),
                            ]),
                          ),
                        );
                      }

                      // if (state is LoadAfterDeleteState) {
                      //   List<Event> events = state.events;
                      //   if (events.length == 0) {
                      //     return Center(
                      //       child: Text("No events yet."),
                      //     );
                      //   }
                      //   return SizedBox(
                      //     height: 400,
                      //     child: ListView.builder(
                      //       itemCount: events.length,
                      //       itemBuilder: (_, id) => _ManageableEvents(
                      //         eventTitle: '${events.elementAt(id).title}',
                      //         eventId: events.elementAt(id).id!,
                      //         event: events.elementAt(id),
                      //         eventDescription: events.elementAt(id).description,
                      //       ),
                      //     ),
                      //   );
                      // }

                      return Text("Couldn't fetch events.");
                    }),
                  ],
                ),
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
      required this.event,
      required this.eventDescription})
      : super(key: key);
  String eventTitle;
  int eventId;
  Event event;
  String eventDescription;
  @override
  __ManageableEventsState createState() => __ManageableEventsState();
}

class __ManageableEventsState extends State<_ManageableEvents> with Styles {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.eventTitle}"),
                SizedBox(
                  height: 5,
                ),
                Text("${widget.eventDescription}",
                    style: textStyle_0.copyWith(color: Colors.grey))
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                BlocProvider.of<AdminEventBloc>(this.context)
                    .add(GetOneEventEvent(widget.eventId));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminManageSelectedEdir()));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Delete'),
                    content: const Text(
                        'Are you sure you want to delete this event? '),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          BlocProvider.of<AdminEventBloc>(this.context).add(
                            DeleteEvent(
                              widget.eventId,
                              widget.event.edirId,
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
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

  // alertDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Delete'),
  //           content: Text('Are you sure you want to delete this event?'),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               child: Text('Confirm'),
  //               onPressed: () {},
  //             ),
  //           ],
  //         );
  //       });
  // }
}
