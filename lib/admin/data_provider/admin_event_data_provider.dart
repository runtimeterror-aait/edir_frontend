import 'dart:convert';

import 'package:edir/auth/data_provider/user_provider.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/models/event.dart';
import 'package:http/http.dart' as http;

class AdminEventDataProvider with Credentials {
  static final String _baseUrl = "http://127.0.0.1:8000/api/v1/events";

// Create Event
  Future<String> createEvent(Event event) async {
    Edir edir = await getEdir();
    final url = Uri.parse("$_baseUrl/");
    final t = await token();
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: jsonEncode({
        "title": event.title,
        "description": event.description,
        "event_date": event.eventDate.toIso8601String(),
        "edir_id": edir.id,
      }),
    );

    if (response.statusCode == 200) {
      return "Created event successfully";
    } else {
      throw Exception("Failed to create edir");
    }
  }

// Get the current edir
  Future<Edir> getEdir() async {
    final urlEdir =
        Uri.parse("http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10");
    final t = await token();

    final responseEdir = await http.get(
      urlEdir,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    final edir = Edir.fromJson(
      jsonDecode(responseEdir.body),
    );
    return edir;
  }

// Get all events
  Future<List<Event>> getAllEvents() async {
    Edir edir = await getEdir();
    print(edir);
    final url = Uri.parse(
        "http://127.0.0.1:8000/api/v1/events/${edir.id}?skip=0&limit=20");

    final t = await token();
    print("token");
    print(t);
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    if (response.statusCode == 200) {
      final events = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final eventsList =
          events.map<Event>((json) => Event.fromJson(json)).toList();
      print(eventsList);
      return eventsList;
    } else {
      print("response");
      throw Exception("Could not fetch events");
    }
  }

  // Get member events
  Future<List<Event>> getMemberEvents() async {
    final Uri url = Uri.parse("$_baseUrl/1");
    final t = await token();

    final http.Response response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );

    if (response.statusCode == 200) {
      final events = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final eventsList =
          events.map<Event>((json) => Event.fromJson(json)).toList();
      print(eventsList);

      return eventsList;
    } else {
      throw Exception("Couldn't fetch event");
    }
  }
// Get one Event

  Future<Event> getOneEvent(int eventId) async {
    Edir edir = await getEdir();
    final Uri url = Uri.parse("$_baseUrl/${edir.id}/$eventId");
    final t = await token();
    final http.Response response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $t',
      },
    );

    if (response.statusCode == 200) {
      final event = Event.fromJson(
        jsonDecode(response.body),
      );
      return event;
    } else {
      throw Exception("Couldn't fetch event");
    }
  }

// Update Event

  Future<Event> updateEvent(Event event, int eventId) async {
    final url = Uri.parse("$_baseUrl/$eventId");
    final t = await token();
    final response = await http.put(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: jsonEncode(
        {
          "title": event.title,
          "description": event.description,
          "event_date": event.eventDate.toIso8601String(),
        },
      ),
    );

    if (response.statusCode == 200) {
      final event = Event.fromJson(jsonDecode(response.body));

      return event;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Couldn't update event");
    }
  }

  // Delete Event

  Future<List<Event>> deleteEvent(int eventId) async {
    final url = Uri.parse("$_baseUrl/$eventId");
    var t = await token();
    final response = await http.delete(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );
    if (response.statusCode == 200) {
      print("Successfully deleted.");

      return await getAllEvents();
    } else {
      print("Deletion failed.");

      return await getAllEvents();
    }
  }
}

void main() async {
  AdminEventDataProvider adminEventDataProvider = AdminEventDataProvider();
  // Event event = Event(
  //   title: "Gathering",
  //   description: "this is cleanings",
  //   eventDate: DateTime.now(),
  //   edirId: 2,
  // );

  // await adminEventDataProvider.createEvent(event);

  final edir = await adminEventDataProvider.getMemberEvents();

  print(edir);
}
