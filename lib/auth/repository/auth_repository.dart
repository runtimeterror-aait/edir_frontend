import 'package:edir/auth/bloc/auth_event.dart';
import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/data_provider.dart';

class AuthRepository {
  final _provider = AuthDataProvider();

  Future<User> signUp(User user) {
    return _provider.signUp(user);
  }

  Future<Login> logIn(String email, String password) {
    return _provider.logIn(email, password);
  }

  Future<void> addUser(Login login) async {
    return _provider.addUser(login);
  }

  Future<void> LogOut(Login login) async {
    return _provider.logout();
  }
}

class NetworkError extends Error {}
