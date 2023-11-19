import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormat {
  static Widget bold({
    required String text,
    TextAlign? textAlign,
    double? opacity,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 22,
        color: textColor ?? Colors.black.withOpacity(opacity ?? 1),
        fontWeight: fontWeight ?? FontWeight.w800,
      ),
    );
  }

  static Widget small({
    required String text,
    TextAlign? textAlign,
    double? opacity,
    Color? textColor,
    FontWeight? fontWeight,
    void Function()? onTap,
    TextDecoration? decoration,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: textColor ?? Colors.black.withOpacity(opacity ?? 1),
          fontWeight: fontWeight,
          decoration: decoration,
        ),
      ),
    );
  }

  static Widget extraSmall({
    required String text,
    TextAlign? textAlign,
    double? opacity,
    Color? textColor,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: textColor ?? Colors.black.withOpacity(opacity ?? 1),
        fontWeight: fontWeight,
      ),
    );
  }
}
