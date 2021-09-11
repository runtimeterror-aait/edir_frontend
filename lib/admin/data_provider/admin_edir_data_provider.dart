import 'dart:convert';
import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:http/http.dart' as http;

class AdminEdirDataProvider with Credentials {
// Get the current edir
  Future<Edir> getCurrentEdir() async {
    final url = Uri.parse("http://127.0.0.1:8000/v1/edirs/?skip=0&limit=10");
    var t = await token();
    final response = await http.get(
      url,
      headers: <String, String>{
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
    );

    var res = jsonDecode(response.body);
    final edir = Edir.fromJson(
      jsonDecode(response.body),
    );
    return edir;
  }

// Create new edir
  Future<String> createEdir(Edir edir) async {
    final url = Uri.parse("http://localhost:8000/v1/edirs/");
    var t = await token();
    var data = {
      "name": edir.name,
      "payment_frequency": edir.paymentFrequency,
      "initial_deposit": edir.initialDeposit,
      "username": edir.username
    };
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return "Edir successfully created.";
    } else {
      return "Failed to create edir";
    }
  }

  // Remove Edir
  Future<String> updateEdir(int edirId, Edir edir) async {
    String _baseUrl = "http://localhost:8000/v1/edirs";
    final url = Uri.parse("$_baseUrl/$edirId");
    var t = await token();
    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
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
