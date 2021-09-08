import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthDataProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://localhost:8000/api/v1/auth/signup';
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<User> signUp(User user) async {
    var data = {
      "full_name": user.full_name,
      "email": user.email,
      "phone": user.phone,
      "role": user.role,
      "password": user.password
    };

    try {
      var response = await _dio.post(_baseUrl, data: data);
      return User.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<Login> logIn(String email, String password) async {
    var data = {"email": email, "password": password};

    try {
      var response = await _dio.post(_baseUrl, data: data);
      return Login.fromJson(response.data);
    } catch (error, stacktrace) {
      print(error);
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<void> addUser(Login login) async {
    String log = jsonEncode(login);
    await _storage.write(key: "user", value: log);
  }

  Future<void> logout() async {
    await _storage.delete(key: "user");
  }

  Future<bool> isLoggedIn() async {
    var user = await _storage.read(key: "user");
    if (user == null) {
      return false;
    }

    return true;
  }
}
