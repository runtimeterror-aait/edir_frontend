import 'dart:convert';
import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:http/http.dart' as http;

class AdminEdirDataProvider with Credentials {
  final String _baseUrl = "http://localhost:8000/v1/edirs";

// Get the current edir
  Future<Edir> getCurrentEdir() async {
    final url = Uri.parse("http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10");

    final response = await http.get(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final edir = Edir.fromJson(
      jsonDecode(response.body),
    );
    return edir;
  }

// Create new edir
  Future<String> createEdir(Edir edir) async {
    final url = Uri.parse("$_baseUrl/");

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: edirToJson(edir),
    );
    if (response.statusCode == 200) {
      return "Edir successfully created.";
    } else {
      return "Failed to create edir";
    }
  }

  // Remove Edir
  Future<String> updateEdir(int edirId, Edir edir) async {
    final url = Uri.parse("$_baseUrl/$edirId");

    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
        {
          "name": edir.name,
          "initial_deposit": edir.initialDeposit,
          "payment_frequency": edir.paymentFrequency,
        },
      ),
    );

    if (response.statusCode == 200) {
      return "Updated edir successfully";
    } else {
      return "Updating edir failed";
    }
  }
}
