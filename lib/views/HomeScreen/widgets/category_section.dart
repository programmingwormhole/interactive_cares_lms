import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_cares_lms/controllers/home_controller.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text('Categories',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black.withOpacity(.6),
        ),),
        SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 70,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(.1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(controller.categories[index].icon),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65,
                    child: Text(
                      controller.categories[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
