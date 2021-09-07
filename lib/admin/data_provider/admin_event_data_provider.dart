import 'dart:convert';

import 'package:edir/core/models/event.dart';
import 'package:http/http.dart' as http;

class AdminDataProvider {
  static final String _baseUrl = "http://127.0.0.1:8000/api/v1/events";
  final token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzEzOTYxMjYsImlhdCI6MTYzMDk2NDEyNiwic3ViIjoibGl5dWFkbWluQGdtYWlsLmNvbSJ9.PTE2mYsS4xS7BMDfgRxouHXc09SVFsiAxoYkpKrPmXY";

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
      print(response.body);
      print(response.statusCode);
      throw Exception("Failed to create edir");
    }
  }

// Get all events

  Future<List<Event>> getAllEvents(int edirId) async {
    final url = Uri.parse(
        "http://127.0.0.1:8000/api/v1/events/$edirId?skip=0&limit=20");
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

  Future<Event> getOneEvent(int edirId, int eventId) async {
    final Uri url = Uri.parse("$_baseUrl/$edirId/$eventId");
    final http.Response response = await http.get(
      url,
      headers: {'accept': 'application/json', 'Authorization': 'Bearer $token'},
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

  Future<void> deleteEvent(int eventId) async {
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
    } else {
      print("other than 200");
    }
  }
}

void main() async {
  AdminDataProvider adminDataProvider = AdminDataProvider();
  Event event = Event(
    title: "Gathering",
    description: "this is cleaning",
    eventDate: DateTime.now(),
    edirId: 2,
  );

  await adminDataProvider.createEvent(event);

  // final edir = await adminDataProvider.deleteEvent(9);
}
