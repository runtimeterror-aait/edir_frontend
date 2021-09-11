part of 'admin_event_bloc.dart';

@immutable
abstract class AdminEventEvent extends Equatable {
  const AdminEventEvent();
}

class CreateEventEvent extends AdminEventEvent {
  final Event event;

  const CreateEventEvent(this.event);

  @override
  List<Object?> get props => [event];

  @override
  String toString() => 'Create event {event: $event}';
}

class GetOneEventEvent extends AdminEventEvent {
  final int eventId;

  const GetOneEventEvent(this.eventId);

  @override
  List<Object?> get props => [eventId];
}

class GetAllEventsEvent extends AdminEventEvent {
  GetAllEventsEvent();

  @override
  List<Object?> get props => [];
}

class GetAllMemberEventsEvent extends AdminEventEvent {
  GetAllMemberEventsEvent();

  @override
  List<Object?> get props => [];
}

class UpdateEventEvent extends AdminEventEvent {
  final int eventId;
  final Event event;

  UpdateEventEvent(this.eventId, this.event);

  @override
  List<Object?> get props => [eventId, event];

  @override
  String toString() => 'Update edir {edirId: $eventId}';
}

class DeleteEvent extends AdminEventEvent {
  final int eventId;
  final int edirId;
  final DateTime timestamp = DateTime.now();
  DeleteEvent(this.eventId, this.edirId);

  @override
  List<Object?> get props => [eventId, edirId, timestamp];
}
