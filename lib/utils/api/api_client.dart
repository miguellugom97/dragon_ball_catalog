import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._privateConstructor();

  static final ApiClient _instance = ApiClient._privateConstructor();

  static ApiClient get instance => _instance;

  final http.Client client = http.Client();
}