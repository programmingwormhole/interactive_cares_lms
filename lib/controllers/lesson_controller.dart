import 'package:get/get.dart';
import 'package:interactive_cares_lms/models/course_model.dart';

class LessonController extends GetxController {
  var currentLessonIndex = 0.obs;

  void nextLesson() {
    if (currentLessonIndex.value < lessons.length - 1) {
      currentLessonIndex.value++;
    }
  }

  void previousLesson() {
    if (currentLessonIndex.value > 0) {
      currentLessonIndex.value--;
    }
  }

  Lessons get currentLesson => lessons[currentLessonIndex.value];

  final List<Lessons> lessons;

  LessonController({required this.lessons});

}