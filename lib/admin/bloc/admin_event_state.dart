part of 'admin_event_bloc.dart';

@immutable
abstract class AdminEventState extends Equatable {}

class EventInitialState extends AdminEventState {
  @override
  List<Object> get props => [];
}

class EventLoadingState extends AdminEventState {
  @override
  List<Object> get props => [];
}

class AllEventsLoadedState extends AdminEventState {
  final List<Event> events;

  AllEventsLoadedState({required this.events});

  @override
  List<Object> get props => [events];
}

class OneEventLoadedState extends AdminEventState {
  final Event event;
  final List<Event> events;

  OneEventLoadedState({required this.event, required this.events});

  @override
  List<Object> get props => [event, events];
}

class LoadAfterDeleteState extends AdminEventState {
  final List<Event> events;

  LoadAfterDeleteState({required this.events});

  @override
  List<Object> get props => [events];
}

class EventOperationFailedState extends AdminEventState {
  @override
  List<Object> get props => [];
}
