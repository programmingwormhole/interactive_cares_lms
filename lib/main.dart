import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/bindings/all_bindings.dart';
import 'package:interactive_cares_lms/routes/route_destinations.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import 'package:interactive_cares_lms/utils/colors.dart';
import 'package:interactive_cares_lms/utils/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
      ),
      getPages: Routes.destination,
      initialRoute: RouteNames.initial,
    );
  }
}
