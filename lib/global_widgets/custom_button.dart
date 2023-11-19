

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onTap;
  final bool? isBorder;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.buttonTitle,
    this.onTap,
    this.isBorder,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isBorder == true ? null : AppColors.primary,
          border:
              isBorder == true ? Border.all(color: AppColors.primary) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: isLoading == true ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                buttonTitle,
                style: GoogleFonts.poppins(
                    color: isBorder == true ? AppColors.primary : Colors.white,
                    // fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ) : Center(
            child: Text(
              buttonTitle,
              style: GoogleFonts.poppins(
                color: isBorder == true ? AppColors.primary : Colors.white,
                // fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ),
    );
  }
}
