import 'dart:convert';

import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:edir/core/models/payment.dart';
import 'package:http/http.dart' as http;

class AdminPaymentDataProvider with Credentials {
  final _baseUrl = "http://127.0.0.1:8000/api/v1/payments";

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

  Future<List<Payment>> getAllPayments(int memberId) async {
    Edir edir = await getEdir();
    final t = await token();

    final url = Uri.parse("$_baseUrl/${edir.id}/$memberId");
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    if (response.statusCode == 200) {
      final payments = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final paymentsList =
          payments.map<Payment>((json) => Payment.fromJson(json)).toList();
      print(paymentsList);
      return paymentsList;
    } else {
      print(response.statusCode);
      throw Exception("Could not fetch payments");
    }
  }

  Future<List<Payment>> getMemberPayments(int memberId, int edirId) async {
    final t = await token();

    final url = Uri.parse(
        "http://127.0.0.1:8000/api/v1/paymentsuser/$memberId?edir_id=$edirId&skip=0&limit=10");
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    if (response.statusCode == 200) {
      final payments = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final paymentsList =
          payments.map<Payment>((json) => Payment.fromJson(json)).toList();
      print(paymentsList);
      return paymentsList;
    } else {
      print(response.statusCode);
      throw Exception("Could not fetch payments");
    }
  }

  Future<String> addPayment(int memberId, Payment payment) async {
    Edir edir = await getEdir();
    final t = await token();

    final url = Uri.parse("$_baseUrl/");
    http.Response response = await http.post(url,
        headers: <String, String>{
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $t'
        },
        body: paymentToJson(payment));

    if (response.statusCode == 200) {
      print("Payment added");
      return "Payment added successfully";
      // final payments = jsonDecode(response.body).cast<Map<String, dynamic>>();
      // final paymentsList =
      //     payments.map<Payment>(paymentFromJson(response.body)).toList();
      // print(paymentsList);
      // return paymentsList;
    } else {
      print(response.statusCode);
      throw Exception("Could not add payment");
    }
  }

  Future<String> removePayment(int paymentId) async {
    Edir edir = await getEdir();
    final t = await token();

    final url = Uri.parse("$_baseUrl/$paymentId");
    http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    if (response.statusCode == 200) {
      return "Payment deleted successfully";
      // final payments = jsonDecode(response.body).cast<Map<String, dynamic>>();
      // final paymentsList =
      //     payments.map<Payment>(paymentFromJson(response.body)).toList();
      // print(paymentsList);
      // return paymentsList;
    } else {
      print(response.statusCode);
      throw Exception("Could not delete payment");
    }
  }
}

main(List<String> args) async {
  Payment payment = Payment(
      note: "This is a note",
      payment: 100,
      memberId: 22,
      paymentDate: DateTime.now());

  AdminPaymentDataProvider dataprovider = AdminPaymentDataProvider();
  dataprovider.getAllPayments(28);
}
