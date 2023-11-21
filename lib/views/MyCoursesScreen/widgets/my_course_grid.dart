import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/course_controller.dart';
import 'package:interactive_cares_lms/models/course_model.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import 'package:interactive_cares_lms/utils/assets_manager.dart';
import 'package:interactive_cares_lms/utils/colors.dart';
import 'package:interactive_cares_lms/utils/themes.dart';
import '../../../helpers/star_display_helper.dart';

class MyCourseGrid extends StatelessWidget {
  final CourseModel course;

  const MyCourseGrid({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteNames.courseLearn, arguments: course),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.1,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: ImageManager.logo,
                      image: course.thumbnail,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 5, right: 8, left: 8, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 42,
                      child: TextFormat.small(
                        text: course.title,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: StarDisplayWidget(
                              value: course.rating!,
                              filledStar: Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: 15,
                              ),
                              unfilledStar: Icon(
                                Icons.star_border,
                                color: AppColors.primary.withOpacity(.5),
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Text(
                              '( ${course.rating} )',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<CourseController>(
                      builder: (controller) {
                        controller.calculateOverallCourseProgress(course);
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: LinearProgressIndicator(
                                  value:
                                      controller.overallCourseProgress.value),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormat.extraSmall(
                                    text:
                                        '${(controller.overallCourseProgress.value * 100).toStringAsFixed(0)}% Completed',
                                    opacity: .5,
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            "Continue Course",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
