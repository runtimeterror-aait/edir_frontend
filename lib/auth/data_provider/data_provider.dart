import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthDataProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://localhost:8000/api/v1/auth';
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
      var response = await _dio.post(_baseUrl + "/signup", data: data);
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return User.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<Login> logIn(String email, String password) async {
    var data = {"email": email, "password": password};

    try {
      var response = await _dio.post(_baseUrl + "/login", data: data);
      var user = Login.fromJson(response.data);
      try {
        await _storage.write(key: "user", value: jsonEncode(user));
      } catch (e) {
        print(e);
      }
      return user;
    } catch (error) {
      print(error);
      throw Exception("Exception occured: $error");
    }
  }

  Future<void> addUser(Login login) async {
    String log = jsonEncode(login);
    await _storage.write(key: "user", value: log);
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<bool> isLoggedIn() async {
    var user = await _storage.read(key: "user");
    if (user == null) {
      return false;
    }

    return true;
  }

  Future<Login> loggedInUser() async {
    var user = await _storage.read(key: "user");
    if (user == null) {
      throw Exception("User not logged in");
    } else {
      var usr = jsonDecode(user.toString());
      return Login.fromJson(usr);
    }
  }
}
