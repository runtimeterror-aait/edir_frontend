import 'package:dio/dio.dart';
import 'package:edir/auth/models/user.dart';

class AuthDataProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://localhost:8000/api/v1/auth/signup';

  Future<User> signUp(User user) async {
    var data = {
      "full_name": user.full_name,
      "email": user.email,
      "phone": user.phone,
      "role": user.role,
      "password": user.password
    };

    try {
      var response = _dio.post(_baseUrl, data: data);
      return User.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
