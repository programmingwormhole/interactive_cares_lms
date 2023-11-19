import 'package:interactive_cares_lms/utils/config.dart';

class AppUrls {
  static const String apiVersion = 'v1';
  static const String apiUrl = '${AppConfig.baseUrl}/api/$apiVersion';
  static Uri login = Uri.parse('$apiUrl/login');
  static Uri register = Uri.parse('$apiUrl/register');
}