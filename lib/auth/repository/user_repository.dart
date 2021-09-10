import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/user_provider.dart';

class UserRepository {
  final _provider = UserDataProvider();

  Future<User> updateUser(User user) {
    return _provider.updateUser(user);
  }

  Future<User> loggedInUserData() {
    return _provider.loggedInUserData();
  }

  Future<void> deleteUser() {
    return _provider.deleteUser();
  }
}

class NetworkError extends Error {}
