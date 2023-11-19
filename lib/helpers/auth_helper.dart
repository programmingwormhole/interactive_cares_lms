import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<String?> getToken () async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    return token;
  }

  static Future removeToken () async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }
}