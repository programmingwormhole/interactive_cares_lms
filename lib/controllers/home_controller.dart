import 'package:get/get.dart';
import 'package:interactive_cares_lms/models/category_model.dart';
import 'package:interactive_cares_lms/models/course_model.dart';
import 'package:interactive_cares_lms/models/user_model.dart';

class HomeController extends GetxController {
  final UserModel user = UserModel();
  List<CategoryModel> categories = getCategories;
  List<CourseModel> featuredCourses = getFeaturedCourse;
  RxInt selectedSliderIndex = RxInt(0);

  changeSliderIndex(int index) {
    selectedSliderIndex.value = index;
    update();
  }
}
