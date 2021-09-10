import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/user_provider.dart';

class UserRepository {
  final _provider = UserDataProvider();

  Future<User> signUp(User user) {
    return _provider.updateUser(user);
  }

  Future<void> deleteUser() {
    return _provider.deleteUser();
  }
}

class NetworkError extends Error {}
