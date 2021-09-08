import 'package:edir/admin/bloc/admin_event_bloc.dart';
import 'package:edir/admin/data_provider/admin_event_data_provider.dart';
import 'package:edir/core/models/event.dart';

class AdminEventRepository {
  final AdminDataProvider dataProvider;
  AdminEventRepository(this.dataProvider);

  Future<String> create(Event event) async {
    return this.dataProvider.createEvent(event);
  }

  Future<Event> getOneEvent(int edirId, int eventId) async {
    return this.dataProvider.getOneEvent(edirId, eventId);
  }

  Future<List<Event>> getAllEvents(int edirId) async {
    return this.dataProvider.getAllEvents(edirId);
  }

  Future<Event> updateEvent(Event event, int eventId) async {
    return this.dataProvider.updateEvent(event, eventId);
  }

  Future<List<Event>> deleteEvent(int eventId) async {
    return this.dataProvider.deleteEvent(eventId);
  }
}

main(List<String> args) async {
  AdminEventRepository repository = AdminEventRepository(AdminDataProvider());
  await repository.deleteEvent(15);
}
