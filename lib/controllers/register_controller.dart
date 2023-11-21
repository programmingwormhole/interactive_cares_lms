import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/core/services/auth_services.dart';
import 'package:interactive_cares_lms/models/user_model.dart';
import '../global_widgets/custom_alert.dart';
import '../routes/route_names.dart';
import '../utils/assets_manager.dart';

class RegisterController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  RxString emailError = RxString('');
  RxString confirmPasswordError = RxString('');
  final UserModel user = UserModel();
  final RxBool isLoading = false.obs;

  void validateEmail(String email) {
    // Regular expression for a simple email validation
    String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailRegex);

    if (regex.hasMatch(email)) {
      emailError.value = '';
    } else {
      emailError.value = 'Invalid email address';
    }
  }

  void validateConfirmPassword(String confirmPassword) {
    // Confirm Password validation logic
    if (confirmPassword != user.password) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  void register() async {
    isLoading.value = true;
    final bool isRegistered = await AuthServices.register(user: user);
    isLoading.value = false;
    update();
    if (isRegistered) {
      Get.dialog(
        CustomAlert(
          title: 'Congratulations',
          description: 'You have completed your registration!',
          buttonText: 'Sounds Good!',
          image: AnimationManager.success,
          isAnimated: true,
          onButtonTap: () => Get.offAllNamed(RouteNames.home),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.dialog(
        const CustomAlert(
          title: 'Error!',
          description: 'Something is wrong while trying to register!',
          buttonText: 'Try Again',
          image: AnimationManager.error,
          isAnimated: true,
        ),
        barrierDismissible: false,
      );
    }
  }
}
