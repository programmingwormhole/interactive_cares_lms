import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/controllers/home_controller.dart';
import 'package:interactive_cares_lms/utils/themes.dart';
import '../../../utils/colors.dart';

class LatestCoursesSection extends StatelessWidget {
  const LatestCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Latest Courses',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            Text(
              'View All',
              style: GoogleFonts.poppins(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: controller.featuredCourses.length,
          itemBuilder: (ctx, index) {
            final data = controller.featuredCourses[index];
            return SizedBox(
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
                            placeholder: 'assets/images/logo.webp',
                            image: data.thumbnail,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5, right: 8, left: 8, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 42,
                            child: TextFormat.small(
                              text: data.title,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          data.salePrice != null ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormat.small(
                                text: '৳${data.salePrice}',
                                textColor: AppColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                              TextFormat.small(
                                text: '৳${data.regularPrice}',
                                decoration: TextDecoration.lineThrough
                              ),
                            ],
                          ) : TextFormat.small(
                            text: '৳${data.regularPrice}',
                            textColor: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primary, width: 1.5),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Text("Buy Now"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
      ],
    );
  }
}
