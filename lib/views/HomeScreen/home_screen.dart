import 'package:flutter/material.dart';
import 'package:interactive_cares_lms/views/HomeScreen/widgets/category_section.dart';
import 'package:interactive_cares_lms/views/HomeScreen/widgets/featured_course_section.dart';
import 'package:interactive_cares_lms/views/HomeScreen/widgets/home_app_bar.dart';
import 'package:interactive_cares_lms/views/HomeScreen/widgets/leatest_courses_section.dart';
import 'package:interactive_cares_lms/views/HomeScreen/widgets/slider_section.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * .22,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeAppBar(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        children: [
                          SliderSection(),
                          CategorySection(),
                          FeaturedCourseSection(),
                          LatestCoursesSection(),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
