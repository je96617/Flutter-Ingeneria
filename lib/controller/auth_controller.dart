import 'dart:convert';


class AuthController {
  static Future<bool> login(String username, String password) async {
    return username == 'admin' && password == 'admin';
  }

  static Future<void> logout() async {}
}

