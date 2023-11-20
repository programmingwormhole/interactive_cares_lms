import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_lms/controllers/bookmark_controller.dart';
import 'package:interactive_cares_lms/global_widgets/custom_app_bar.dart';
import 'package:interactive_cares_lms/routes/route_names.dart';
import '../../utils/colors.dart';
import '../../utils/themes.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final controller = Get.put(BookmarkController());

  @override
  void initState() {
    super.initState();
    controller.retrieveBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Obx(() {
        final bookmarks = controller.bookmarks;
        return bookmarks.isEmpty ? const Center(
          child: Text("You don't have any bookmark lesson"),
        ) : ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            final data = bookmarks[index];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 1,
                    )
                  ],),
              child: ListTile(
                onTap: () =>
                    Get.toNamed(RouteNames.bookmarkPlayer, arguments: {
                      'data' : data,
                      'index' : index,
                    }),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(data['course_thumbnail']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Course: ${data['course_name']}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson: ${data['title']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(.1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextFormat.extraSmall(
                              text: data['time'].toString(),
                              textColor: Colors.deepPurple,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.deleteBookmark(index),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary.withOpacity(.1),
                            child: Icon(
                              Icons.delete,
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
