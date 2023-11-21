import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/course_controller.dart';
import 'package:interactive_cares_lms/global_widgets/custom_app_bar.dart';
import 'widgets/my_course_grid.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseController());
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: AlignedGridView.count(
          padding: const EdgeInsets.all(10.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: 2,
          itemBuilder: (ctx, index) {
            final course = controller.featuredCourses[index];
            return MyCourseGrid(
              course: course,
            );
          },
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
      ),
    );
  }
}
