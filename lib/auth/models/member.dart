import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  Member({
    this.id,
    this.userId,
    this.edirId,
    this.status,
  });

  int? id;
  int? userId;
  int? edirId;
  String? status;

  Member copyWith({
    int? id,
    int? userId,
    int? edirId,
    String? status,
  }) =>
      Member(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        edirId: edirId ?? this.edirId,
        status: status ?? this.status,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        userId: json["user_id"],
        edirId: json["edir_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "edir_id": edirId,
        "status": status,
      };
}
