import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/admin/repository/admin_event_repository.dart';
import 'package:edir/core/models/event.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'admin_event_event.dart';
part 'admin_event_state.dart';

class AdminEventBloc extends Bloc<AdminEventEvent, AdminEventState> {
  AdminEventRepository eventRepository;

  // Future<List<Event>> eventsMethon() async {
  //   final List<Event> events =  await eventRepository.getAllEvents(2);
  //   yeield events;
  // }

  AdminEventBloc({required this.eventRepository}) : super(EventInitialState());

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
        final List<Event> events = await eventRepository.getAllEvents();
        yield AllEventsLoadedState(events: events);
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
    }
  }

  // bool _isTitleEmpty(String value) => value.isEmpty;
}
