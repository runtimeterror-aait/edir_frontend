import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/repository/admin_event_repository.dart';
import 'package:edir/auth/bloc/bloc.dart';
import 'package:edir/core/models/event.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:edir/auth/data_provider/user_provider.dart';

part 'admin_event_event.dart';
part 'admin_event_state.dart';

class AdminEventBloc extends Bloc<AdminEventEvent, AdminEventState> {
  AdminEventRepository eventRepository =
      AdminEventRepository(AdminEventDataProvider());

  // Future<List<Event>> eventsMethon() async {
  //   final List<Event> events =  await eventRepository.getAllEvents(2);
  //   yeield events;
  // }

  AdminEventBloc() : super(EventInitialState());

  @override
  Stream<AdminEventState> mapEventToState(
    AdminEventEvent event,
  ) async* {
    if (event is CreateEventEvent) {
      print("inside create event");
      try {
        yield EventLoadingState();
        await eventRepository.create(event.event);
        final List<Event> events = await eventRepository.getAllEvents();
        yield AllEventsLoadedState(events: events);
      } catch (_) {
        yield EventOperationFailedState();
      }
    } else if (event is GetAllEventsEvent) {
      try {
        yield EventLoadingState();
        try {
          final List<Event> events = await eventRepository.getAllEvents();

          yield AllEventsLoadedState(events: events);
        } catch (e) {
          print("here");
          print(e);
        }
      } catch (_) {
        yield EventOperationFailedState();
      }
    } else if (event is GetOneEventEvent) {
      try {
        final Event oneEvent = await eventRepository.getOneEvent(event.eventId);
        // final List<Event> events = await eventRepository.getAllEvents();
        yield OneEventLoadedState(getEvent: oneEvent);

        // yield AllEventsLoadedState(events: events);
      } catch (_) {
        yield EventOperationFailedState();
      }
    } else if (event is UpdateEventEvent) {
      try {
        yield EventLoadingState();
        await eventRepository.updateEvent(event.event, event.eventId);

        final List<Event> events = await eventRepository.getAllEvents();
        yield AllEventsLoadedState(events: events);
      } catch (_) {
        yield EventOperationFailedState();
      }
    } else if (event is DeleteEvent) {
      print("inside delete event");
      try {
        yield EventLoadingState();
        final List<Event> events =
            await eventRepository.deleteEvent(event.eventId);
        yield AllEventsLoadedState(events: events);
      } catch (_) {
        yield EventOperationFailedState();
      }
    } else if (event is GetAllMemberEventsEvent) {
      try {
        yield LoadingMemberEventsState();
        final userId = await UserDataProvider()
            .loggedInUserData()
            .then((value) => value.id);

        final List<Event> getEvents =
            await eventRepository.getMemberEvents(userId!);
        yield AllMemberEventsLoadedState(events: getEvents);
      } catch (e) {
        print(e);
        yield EventOperationFailedState();
      }
    }
  }

  // bool _isTitleEmpty(String value) => value.isEmpty;
}
