import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/auth_controller.dart';
import 'package:interactive_cares_lms/bindings/all_bindings.dart';
import 'package:interactive_cares_lms/routes/route_destinations.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import 'package:interactive_cares_lms/utils/colors.dart';
import 'package:interactive_cares_lms/utils/config.dart';
import 'package:interactive_cares_lms/views/Admin/admin_dashboard.dart';
import 'package:interactive_cares_lms/views/Lecturer/lecturer_dashboard.dart';
import 'package:interactive_cares_lms/views/Student/student_dashboard.dart';
import 'package:interactive_cares_lms/views/Authentication/LoginScreen/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authController = Get.put(AuthController());
  await authController.loadUser(); // ✅ allowed now
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
  initialBinding: AllBindings(),
  home: Obx(() {
    final user = Get.find<AuthController>().currentUser.value;
    if (user == null) {
      return LoginPage();
    } else if (user.role == 'admin') {
      return AdminDashboard();
    } else if (user.role == 'lecturer') {
      return LecturerDashboard();
    } else {
      return StudentDashboard();
    }
  }),
);

