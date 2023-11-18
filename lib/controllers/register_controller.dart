import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxString emailError = RxString('');

  RxString confirmPasswordError = RxString('');

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

  void validateConfirmPassword(String confirmPassword) {
    // Confirm Password validation logic
    if (confirmPassword != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }



}