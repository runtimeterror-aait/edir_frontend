import 'package:dio/dio.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/data_provider.dart';

class UserDataProvider {
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
      var response = await _dio.put(_baseUrl, data: data);
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
      try {
        var response = await _dio.get(_baseUrl);
        if (response.statusCode == 200) {
          return User.fromJson(response.data);
        } else {
          return User.fromJson(response.data);
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
      await _auth.logout();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
