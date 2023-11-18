import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'custom_button.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final void Function()? onButtonTap;
  final String? secondButtonText;
  final void Function()? onSecondButtonTap;
  final String image;
  final bool? isAnimated;
  final String? buttonIcon;

  const CustomAlert({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonTap,
    required this.image,
    this.isAnimated,
    this.secondButtonText,
    this.onSecondButtonTap, this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: size.height * .51,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child:
                  isAnimated == true ? Lottie.asset(image) : Image.asset(image),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black.withOpacity(.5),
              ),
            ),
            CustomButton(
              buttonTitle: buttonText,
              onTap: onButtonTap ?? () => Get.back(),
            ),

            if(secondButtonText != null)...[
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                buttonTitle: secondButtonText!,
                isBorder: true,
                onTap: onSecondButtonTap ?? () => Get.back(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
