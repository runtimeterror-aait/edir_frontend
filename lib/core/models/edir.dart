// To parse this JSON data, do
//
//     final edir = edirFromJson(jsonString);

import 'dart:convert';

Edir edirFromJson(String str) => Edir.fromJson(json.decode(str));

String edirToJson(Edir data) => json.encode(data.toJson());

class Edir {
  Edir({
    required this.name,
    required this.initialDeposit,
    this.ownerId,
    this.id,
    required this.paymentFrequency,
    required this.username,
  });

  String? name;
  double? initialDeposit;
  int? ownerId;
  int? id;
  String paymentFrequency;
  String? username;

  Edir copyWith({
    String? name,
    double? initialDeposit,
    int? ownerId,
    int? id,
    String? paymentFrequency,
    String? username,
  }) =>
      Edir(
        name: name ?? this.name,
        initialDeposit: initialDeposit ?? this.initialDeposit,
        ownerId: ownerId ?? this.ownerId,
        id: id ?? this.id,
        paymentFrequency: paymentFrequency ?? this.paymentFrequency,
        username: username ?? this.username,
      );

  factory Edir.fromJson(Map<String, dynamic> json) => Edir(
        name: json["name"],
        initialDeposit: json["initial_deposit"],
        ownerId: json["owner_id"],
        id: json["id"],
        paymentFrequency: json["payment_frequency"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "initial_deposit": initialDeposit,
        "owner_id": ownerId,
        "id": id,
        "payment_frequency": paymentFrequency,
        "username": username,
      };
}
