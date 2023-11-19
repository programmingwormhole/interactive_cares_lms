import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/global_widgets/custom_button.dart';
import 'package:interactive_cares_lms/global_widgets/in_app_bar.dart';
import 'package:interactive_cares_lms/global_widgets/video_player.dart';
import 'package:interactive_cares_lms/models/course_model.dart';
import 'package:interactive_cares_lms/views/LearningScreen/widgets/lesson_info_widget.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final arg = Get.arguments;
    final List<Lessons> lessons = arg['lessons'];
    int currentIndex = arg['index'];
    final Lessons lesson = lessons[currentIndex];
    print(currentIndex);
    return Scaffold(
      appBar: inAppBar('Lesson'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * .2,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ChewieVideoPlayer(
                            videoPlayerController: VideoPlayerController.asset(
                              lesson.lessonUrl,
                            ),
                            autoPlay: false,
                            looping: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: LessonInfoWidget(
                                title: 'Type',
                                subtitle: 'Video',
                                icon: Icons.file_present_sharp,
                              ),
                            ),
                            Expanded(
                              child: LessonInfoWidget(
                                title: 'Size',
                                subtitle: '3.95 MB',
                                icon: Icons.font_download_rounded,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: LessonInfoWidget(
                                title: 'Publish',
                                subtitle: '1 Mar 2022',
                                icon: Icons.date_range_sharp,
                              ),
                            ),
                            Expanded(
                              child: LessonInfoWidget(
                                title: 'Downloadable',
                                subtitle: 'No',
                                icon: Icons.download_for_offline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      buttonTitle: 'Next Lesson',
                      isBorder: true,
                      onTap: () {
                        // setState(() {
                        //   if (currentIndex > 0) {
                        //     currentIndex--;
                        //   }
                        // });
                      },
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomButton(
                      buttonTitle: 'Previous Lesson',
                      isBorder: true,
                      onTap: () {
                        // setState(() {
                        //   if (currentIndex < lessons.length - 1) {
                        //     currentIndex++;
                        //   }
                        // });
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  buttonTitle: 'Complete Lesson',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
