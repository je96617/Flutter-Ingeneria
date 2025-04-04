import 'dart:convert';
import 'package:http/http.dart' as http;

class CarService {
  static const String _baseUrl = 'https://carros-electricos.wiremockapi.cloud';

  static Future<List<dynamic>?> getCars(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/carros'),
      headers: {'Authentication': token},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
