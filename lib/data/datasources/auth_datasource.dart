import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<void> saveToken(String token);
  Future<String?> readToken();
  Future<void> deleteToken();
}

class AuthDataSourceImpl implements AuthDataSource {
  static const _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
