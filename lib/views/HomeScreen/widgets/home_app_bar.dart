import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interactive_cares_lms/helpers/auth_helper.dart';
import 'package:interactive_cares_lms/utils/assets_manager.dart';
import 'package:interactive_cares_lms/utils/themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: AuthHelper.getName(),
                  builder: (context, snapshot) {
                    return TextFormat.bold(
                      text: 'Hi ${snapshot.data ?? 'Shirajul'},',
                      textColor: Colors.white,
                    );
                  },
                ),
                TextFormat.small(
                  text: "Let's start learning",
                  fontWeight: FontWeight.w300,
                  textColor: Colors.white,
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(SvgManager.avatar),
            )
          ],
        )
      ],
    );
  }
}
