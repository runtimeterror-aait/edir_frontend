// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

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
