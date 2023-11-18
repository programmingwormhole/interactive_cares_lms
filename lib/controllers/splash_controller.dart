import 'dart:async';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate () {
    // Logic to go to another screen from splash screen to another screen
    Timer(const Duration(seconds: 5), () {
      Get.offAllNamed(RouteNames.getStarted);
    });
  }
}