// To parse this JSON data, do
//
//     final addMember = addMemberFromJson(jsonString);

import 'dart:convert';

AddMember addMemberFromJson(String str) => AddMember.fromJson(json.decode(str));

String addMemberToJson(AddMember data) => json.encode(data.toJson());

class AddMember {
  AddMember({
    this.userId,
    this.edirUsername,
    this.status,
  });

  int? userId;
  String? edirUsername;
  String? status;

  AddMember copyWith({
    int? userId,
    String? edirUsername,
    String? status,
  }) =>
      AddMember(
        userId: userId ?? this.userId,
        edirUsername: edirUsername ?? this.edirUsername,
        status: status ?? this.status,
      );

  factory AddMember.fromJson(Map<String, dynamic> json) => AddMember(
        userId: json["user_id"],
        edirUsername: json["edir_username"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "edir_username": edirUsername,
        "status": status,
      };
}
