import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/controllers/home_controller.dart';
import 'package:interactive_cares_lms/utils/colors.dart';
import 'package:interactive_cares_lms/utils/themes.dart';

class FeaturedCourseSection extends StatelessWidget {
  const FeaturedCourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Courses',
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
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredCourses.length,
            itemBuilder: (context, index) {
              final data = controller.featuredCourses[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                height: 130,
                width: size.width * .8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black.withOpacity(.050),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth * .4,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                              image: NetworkImage(
                                data.thumbnail,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextFormat.extraSmall(
                                    text: 'By ${data.author}',
                                    opacity: .5,
                                  ),
                                  data.salePrice != null
                                      ? Row(
                                          children: [
                                            TextFormat.small(
                                                text: '৳${data.salePrice}',
                                                textColor: AppColors.primary,
                                                fontWeight: FontWeight.w700),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            TextFormat.small(
                                                text: '৳${data.regularPrice}',
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ],
                                        )
                                      : TextFormat.small(
                                          text: '৳${data.regularPrice}',
                                          textColor: AppColors.primary,
                                          fontWeight: FontWeight.w700),
                                ],
                              ),
                              Container(
                                width: constraints.maxWidth * .5,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          size: 20,
                                          color: AppColors.primary,
                                        ),
                                        Text(
                                          'Add to cart',
                                          style: GoogleFonts.poppins(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
