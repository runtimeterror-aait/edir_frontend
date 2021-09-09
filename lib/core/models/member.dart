// To parse this JSON data, do
//
//     final member = memberFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  Member({
    required this.userId,
    required this.status,
    required this.id,
    required this.edirId,
    required this.user,
  });

  final int userId;
  final String status;
  final int id;
  final int edirId;
  final User user;

  Member copyWith({
    int? userId,
    String? status,
    int? id,
    int? edirId,
    User? user,
  }) =>
      Member(
        userId: userId ?? this.userId,
        status: status ?? this.status,
        id: id ?? this.id,
        edirId: edirId ?? this.edirId,
        user: user ?? this.user,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        userId: json["user_id"],
        status: json["status"],
        id: json["id"],
        edirId: json["edir_id"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "status": status,
        "id": id,
        "edir_id": edirId,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.fullName,
    required this.phone,
    required this.role,
    required this.id,
    required this.email,
    required this.password,
  });

  final String fullName;
  final String phone;
  final String role;
  final int id;
  final String email;
  final String password;

  User copyWith({
    String? fullName,
    String? phone,
    String? role,
    int? id,
    String? email,
    String? password,
  }) =>
      User(
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        role: role ?? this.role,
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        phone: json["phone"],
        role: json["role"],
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "role": role,
        "id": id,
        "email": email,
        "password": password,
      };
}
