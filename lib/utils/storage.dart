class Storage {
  static Future<void> saveToken(String token) async {
    var SharedPreferences;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> getToken() async {
    var SharedPreferences;
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> clearToken() async {
    var SharedPreferences;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
