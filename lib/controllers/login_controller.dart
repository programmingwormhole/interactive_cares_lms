import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString emailError = RxString('');

  void validateEmail(String email) {
    // Regular expression for a simple email validation
    String emailRegex =
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);

    if (regex.hasMatch(email)) {
      emailError.value = '';
      print('Valid $emailError');
    } else {
      emailError.value = 'Invalid email address';
      print('Invalid $emailError');
    }
  }
}