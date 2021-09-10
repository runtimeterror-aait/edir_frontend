import 'package:edir/core/credentials.dart';
import 'package:edir/core/models/edir.dart';
import 'package:http/http.dart' as http;

final String _baseUrl = "http://localhost:8000/v1/edirs/?skip=0&limit=10";

class AdminEdirDataProvider with Credentials {
  Edir edir;
  AdminEdirDataProvider({required this.edir});
}
