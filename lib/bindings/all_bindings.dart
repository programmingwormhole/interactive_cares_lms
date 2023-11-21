import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/bottom_bar_controller.dart';
import 'package:interactive_cares_lms/controllers/course_controller.dart';
import 'package:interactive_cares_lms/controllers/home_controller.dart';
import 'package:interactive_cares_lms/controllers/login_controller.dart';
import 'package:interactive_cares_lms/controllers/register_controller.dart';


class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => CourseController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }

}