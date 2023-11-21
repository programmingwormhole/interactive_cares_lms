import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/controllers/bookmark_controller.dart';
import 'package:interactive_cares_lms/global_widgets/custom_button.dart';
import 'package:interactive_cares_lms/global_widgets/in_app_bar.dart';
import 'package:interactive_cares_lms/global_widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class BookmarkPlayerScreen extends StatelessWidget {
  const BookmarkPlayerScreen({super.key});


  Duration parseTimeToDuration(String timeString) {
    List<String> parts = timeString.split(':');

    // Extract hours, minutes, and seconds
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    double seconds = double.parse(parts[2]);

    // Convert seconds to milliseconds (since milliseconds is the smallest unit supported by Duration)
    int milliseconds = (seconds * 1000).round();

    return Duration(hours: hours, minutes: minutes, milliseconds: milliseconds);
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final arg = Get.arguments as Map;
    return Scaffold(
      appBar:
      inAppBar('Bookmark Player'),
      body: GetBuilder<BookmarkController>(builder: (controller) {
        return Padding(
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
                          Text(arg['data']['title'],
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
                              key: ValueKey(arg['data']['lesson_url']),
                              videoPlayerController:
                              VideoPlayerController.asset(
                                arg['data']['lesson_url'],

                              ),
                              autoPlay: true,
                              looping: true,
                              hideBookmark: true,
                              startAt: parseTimeToDuration(arg['data']['time']),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                buttonTitle: 'Delete Bookmark',
                onTap: () {
                  controller.deleteBookmark(arg['index']);
                  Get.back();
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
