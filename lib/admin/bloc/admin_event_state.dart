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

class EventIgnoredState extends AdminEventState {
  @override
  List<Object> get props => [];
}

class AllEventsLoadedState extends AdminEventState {
  final List<Event> events;
  final DateTime timeStamp = DateTime.now();
  AllEventsLoadedState({required this.events}) : super();

  @override
  List<Object> get props => [events, timeStamp];
}

class OneEventLoadedState extends AdminEventState {
  final Event getEvent;

  OneEventLoadedState({required this.getEvent});

  @override
  List<Object> get props => [getEvent];
}

class AllMemberEventsLoadedState extends AdminEventState {
  final List<Event> events;

  AllMemberEventsLoadedState({required this.events});

  @override
  List<Object> get props => [events];
}

class LoadingMemberEventsState extends AdminEventState {
  @override
  List<Object> get props => [];
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

class MembersEventOperationFailedState extends AdminEventState {
  @override
  List<Object> get props => [];
}
