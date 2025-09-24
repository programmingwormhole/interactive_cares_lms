import 'dart:convert';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var currentUser = Rxn<UserModel>();

  Future<void> login(String username, String password) async {
    // Fake API call (replace with real HTTP later)
    final fakeApiResponse = '''
    {
      "username": "$username",
      "role": "${username == 'admin' ? 'admin' : username == 'lecturer' ? 'lecturer' : 'student'}",
      "token": "mockToken123"
    }
    ''';

    final data = json.decode(fakeApiResponse);
    currentUser.value = UserModel.fromJson(data);

    // Save user data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(data));
  }

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      final data = json.decode(prefs.getString('user')!);
      currentUser.value = UserModel.fromJson(data);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    currentUser.value = null;
  }
}
