import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/course_controller.dart';
import 'package:interactive_cares_lms/models/course_model.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import '../../../utils/colors.dart';
import '../../../utils/themes.dart';

class ModulesSection extends StatelessWidget {
  final CourseModel course;

  const ModulesSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseController>(
      builder: (controller) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: course.topics!.length,
              itemBuilder: (ctx, index) {
                final topic = course.topics![index];
                return Card(
                  color: Colors.white,
                  elevation: 0.3,
                  child: ExpansionTile(
                    key: Key(index.toString()),
                    onExpansionChanged: ((newState) =>
                        controller.handleExpansion(index)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            child: Text(topic.title),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextFormat.extraSmall(
                                      text: topic.totalDuration,
                                      textColor: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextFormat.extraSmall(
                                      text: '${topic.totalLesson} Lessons',
                                      textColor: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    children: [
                      if (index == controller.expandedTileIndex.value)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: topic.lesson!.length,
                          itemBuilder: (ctx, indexLess) {
                            final lesson = topic.lesson![indexLess];
                            return ListTile(
                              onTap: () {
                                controller.currentLessonIndex.value = indexLess;
                                Get.toNamed(
                                  RouteNames.lesson,
                                  arguments: {
                                    'index': indexLess,
                                    'topic_index': index,
                                    'course': course,
                                  },
                                );
                              },
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor:
                                    AppColors.primary.withOpacity(.1),
                                child: Icon(
                                  Icons.video_call,
                                  color: AppColors.primary,
                                ),
                              ),
                              title: Text(lesson.title),
                              trailing: TextFormat.extraSmall(
                                text: lesson.duration,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
