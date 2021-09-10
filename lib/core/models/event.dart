class Event {
  final String title;
  final String description;
  final DateTime eventDate;
  final int edirId;
  int? id;
  Event(
      {required this.title,
      required this.description,
      required this.eventDate,
      required this.edirId,
      id}) {
    this.id = id;
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        title: json['title'],
        description: json['description'],
        eventDate: DateTime.parse(json['event_date']),
        edirId: json['edir_id'],
        id: json['id']);
  }
  Event copyWith({
    String? title,
    String? description,
    DateTime? eventDate,
    int? edirId,
  }) =>
      Event(
        title: title ?? this.title,
        description: description ?? this.description,
        eventDate: eventDate ?? this.eventDate,
        edirId: edirId ?? this.edirId,
      );
}
