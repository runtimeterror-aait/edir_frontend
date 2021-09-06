import 'package:edir/auth/models/user.dart';
import 'package:edir/auth/data_provider/data_provider.dart';

class AuthRepository {
  final _provider = AuthDataProvider();

  Future<User> signUp(User user) {
    return _provider.signUp(user);
  }
}

class NetworkError extends Error {}
