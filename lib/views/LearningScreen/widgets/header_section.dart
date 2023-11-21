import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/models/course_model.dart';
import '../../../helpers/star_display_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/themes.dart';

class HeaderSection extends StatelessWidget {
  final CourseModel arg;

  const HeaderSection({super.key, required this.arg});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
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
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  arg.title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormat.extraSmall(
                        text: 'By ${arg.author}', opacity: .5),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: StarDisplayWidget(
                            value: arg.rating!,
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
                            '( ${arg.rating} )',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                      image:
                          DecorationImage(image: NetworkImage(arg.thumbnail))),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
