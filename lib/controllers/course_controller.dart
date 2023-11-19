import 'package:get/get.dart';

import '../models/course_model.dart';

class CourseController extends GetxController {
  List<CourseModel> featuredCourses = getFeaturedCourse;

  RxInt expandedTileIndex = RxInt(-1);

  // Function to handle expansion state
  void handleExpansion(int index) {
    // Update the expandedTileIndex
    expandedTileIndex.value = index;
    update();
  }


}