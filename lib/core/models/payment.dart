// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.note,
    required this.payment,
    required this.memberId,
    required this.paymentDate,
  });

  final String note;
  final double payment;
  final int memberId;
  final DateTime paymentDate;

  Payment copyWith({
    String? note,
    double? payment,
    int? memberId,
    DateTime? paymentDate,
  }) =>
      Payment(
        note: note ?? this.note,
        payment: payment ?? this.payment,
        memberId: memberId ?? this.memberId,
        paymentDate: paymentDate ?? this.paymentDate,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        note: json["note"],
        payment: json["payment"],
        memberId: json["member_id"],
        paymentDate: DateTime.parse(json["payment_date"]),
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "payment": payment,
        "member_id": memberId,
        "payment_date": paymentDate.toIso8601String(),
      };
}
