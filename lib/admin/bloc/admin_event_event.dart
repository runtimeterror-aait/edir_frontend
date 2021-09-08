part of 'admin_event_bloc.dart';

@immutable
abstract class AdminEventEvent extends Equatable {
  const AdminEventEvent();
}

class CreateEventEvent extends AdminEventEvent {
  final Event event;
  final int edirId;

  const CreateEventEvent(this.event, this.edirId);

  @override
  List<Object?> get props => [event, edirId];

  @override
  String toString() => 'Create event {event: $event, edirId: $edirId}';
}

class GetOneEventEvent extends AdminEventEvent {
  final int eventId;
  final int edirId;

  const GetOneEventEvent(this.edirId, this.eventId);

  @override
  List<Object?> get props => [edirId, eventId];

  @override
  String toString() => 'Get edir {edirId: $edirId, eventId: $edirId}';
}

class GetAllEventsEvent extends AdminEventEvent {
  final int edirId;

  GetAllEventsEvent(this.edirId);

  @override
  List<Object?> get props => [edirId];
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
  DateTime timestamp = DateTime.now();
  DeleteEvent(this.eventId, this.edirId);

  @override
  List<Object?> get props => [eventId, edirId, timestamp];
}
