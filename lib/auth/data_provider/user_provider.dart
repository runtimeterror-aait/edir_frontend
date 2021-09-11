import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:edir/auth/models/addMember.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/data_provider.dart';

import 'package:edir/auth/models/member.dart';
import 'package:edir/core/credentials.dart';
import 'package:http/http.dart' as http;

class UserDataProvider with Credentials {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://localhost:8000/api/v1/user/';
  final AuthDataProvider _auth = AuthDataProvider();

  Future<User> updateUser(User user) async {
    var data = {
      "full_name": user.full_name,
      "email": user.email,
      "phone": user.phone,
      "password": user.password
    };

    try {
      var response = await _dio.put(
        _baseUrl,
        data: data,
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        return User.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<User> loggedInUserData() async {
    var checkLogin = await _auth.isLoggedIn();

    if (checkLogin) {
      var t = await token();
      final header = {
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      };
      try {
        final response = await http.get(
          Uri.parse(_baseUrl),
          headers: header,
        );
        if (response.statusCode == 200) {
          return User.fromJson(jsonDecode(response.body));
        } else {
          return User.fromJson(jsonDecode(response.body));
        }
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    } else {
      print("not logged in from fetch user data");
      throw Exception("Not logged in");
    }
  }

  Future<Member> getJoinedEdir() async {
    var checkLogin = await _auth.isLoggedIn();
    if (checkLogin) {
      var loggedInUser = await loggedInUserData();
      print(loggedInUser);
      final url = "http://localhost:8000/api/v1/members/user/" +
          loggedInUser.id.toString();
      final t = await token();
      final header = {
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      };

      try {
        final response = await http.get(
          Uri.parse(url),
          headers: header,
        );
        if (response.statusCode == 200) {
          return Member.fromJson(jsonDecode(response.body));
        } else {
          return Member.fromJson(jsonDecode(response.body));
        }
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    } else {
      print("not logged in from fetch user data");
      throw Exception("Not logged in");
    }
  }

  Future<AddMember> joinEdir(AddMember member) async {
    var checkLogin = await _auth.isLoggedIn();
    if (checkLogin) {
      var loggedInUser = await loggedInUserData();
      final t = await token();
      final header = {
        "Content-Type": "application/json",
        'accept': 'application/json',
        'Authorization': 'Bearer $t'
      };
      try {
        final response = await http.post(
          Uri.parse("http://localhost:8000/api/v1/members/"),
          headers: header,
          body: jsonEncode({
            "user_id": loggedInUser.id.toString(),
            "edir_username": member.edirUsername.toString(),
            "status": "p"
          }),
        );

        print(response.body);
        if (response.statusCode == 200) {
          return AddMember.fromJson(jsonDecode(response.body));
        } else {
          return AddMember.fromJson(jsonDecode(response.body));
        }
      } catch (error, stacktrace) {
        throw Exception("Exception occured: $error stackTrace: $stacktrace");
      }
    } else {
      print("not logged in from fetch user data");
      throw Exception("Not logged in");
    }
  }

  Future<void> deleteUser() async {
    try {
      await _dio.delete(_baseUrl);
      print("deleted");
      await _auth.logout();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
