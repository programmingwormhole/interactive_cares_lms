import 'package:get/get.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import 'package:interactive_cares_lms/views/Authentication/LoginScreen/login_screen.dart';
import 'package:interactive_cares_lms/views/Authentication/RegisterScreen/register_screen.dart';
import 'package:interactive_cares_lms/views/GetStartedScreen/get_started_screen.dart';
import 'package:interactive_cares_lms/views/HomeScreen/home_screen.dart';
import 'package:interactive_cares_lms/views/SplashScreen/splash_screen.dart';

class Routes {
  static List<GetPage> destination = [
    GetPage(name: RouteNames.initial, page: () => const SplashScreen()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStartedScreen()),
    GetPage(name: RouteNames.login, page: () => const LoginScreen()),
    GetPage(name: RouteNames.register, page: () => const RegisterScreen()),
    GetPage(name: RouteNames.home, page: () => const HomeScreen()),
  ];
}