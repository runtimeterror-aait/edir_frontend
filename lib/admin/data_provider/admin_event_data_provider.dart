import 'dart:convert';

import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/models/event.dart';
import 'package:http/http.dart' as http;

class AdminEventDataProvider with Credentials {
  static final String _baseUrl = "http://127.0.0.1:8000/api/v1/events";

// Create Event
  Future<String> createEvent(Event event) async {
    print("creating..");

    final url = Uri.parse("$_baseUrl/");
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({
        "title": event.title,
        "description": event.description,
        "event_date": event.eventDate.toIso8601String(),
        "edir_id": event.edirId,
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
    final responseEdir = await http.get(
      urlEdir,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
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
    final url = Uri.parse(
        "http://127.0.0.1:8000/api/v1/events/${edir.id}?skip=0&limit=20");
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final events = jsonDecode(response.body).cast<Map<String, dynamic>>();
      print("get All Events Successful");

      final eventsList =
          events.map<Event>((json) => Event.fromJson(json)).toList();

      return eventsList;
    } else {
      throw Exception("Could not fetch events");
    }
  }

// Get one Event

  Future<Event> getOneEvent(int eventId) async {
    Edir edir = await getEdir();
    final Uri url = Uri.parse("$_baseUrl/${edir.id}/$eventId");
    final http.Response response = await http.get(
      url,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
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

    final response = await http.put(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
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
    final response = await http.delete(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
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
  Event event = Event(
    title: "Gathering",
    description: "this is cleanings",
    eventDate: DateTime.now(),
    edirId: 2,
  );

  // await adminEventDataProvider.createEvent(event);

  final edir = await adminEventDataProvider.updateEvent(event, 39);
  print(edir.description);
}
