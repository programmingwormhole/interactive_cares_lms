import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const LessonInfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.withOpacity(.1),
        child: Icon(icon,
          color: Colors.black.withOpacity(.5),
        ),
      ),
      title: Text(title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w200,
          fontSize: 12,
        ),
      ),
      subtitle: Text(subtitle,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }
}
