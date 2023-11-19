import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';

import '../core/services/auth_services.dart';
import '../global_widgets/custom_alert.dart';
import '../models/user_model.dart';
import '../utils/assets_manager.dart';

class LoginController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  RxString emailError = RxString('');
  final UserModel user = UserModel();
  final RxBool isLoading = false.obs;

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

  void login() async {
    isLoading.value = true;
    final bool loginSuccess = await AuthServices.login(user: user);
    isLoading.value = false;
    update();
    if (loginSuccess) {
      Get.offAllNamed(RouteNames.home);
    }
  }
}