import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class ApiBase {
  String? baseUrl;


  Future<dynamic> get(String endpoint) async {
    if (baseUrl == null) {
      throw Exception('There is no base URL configured.');
    }

    return await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Authorization': r'Bearer ' + dotenv.env['API_TOKEN']!,
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'User-Token': r"$2y$10$rNuOHZ7yIuAkBphr2q4fbuwMbWYKhxvpZZC5xtV6MRXMX5HzbZGq6",
        }
    );
  }
}