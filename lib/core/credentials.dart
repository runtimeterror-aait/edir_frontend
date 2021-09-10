import 'package:edir/auth/models/login.dart';
import 'package:edir/auth/data_provider/data_provider.dart';

class Credentials {
  final AuthDataProvider auth = AuthDataProvider();

  Future<String> token() async {
    Login user = await auth.loggedInUser();
    return user.token;
  }
}
