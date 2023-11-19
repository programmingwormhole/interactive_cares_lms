import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<String?> getToken () async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    return token;
  }

  static Future<String?> getName () async {
    final pref = await SharedPreferences.getInstance();
    final name = pref.getString('name');
    return name;
  }

  static Future removeToken () async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }
}