import 'package:flutter/material.dart';

import '../../../helpers/star_display_helper.dart';
import '../../../utils/colors.dart';

class InstructorSection extends StatelessWidget {
  const InstructorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary,
          child: const Text(
            'IC',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: const Text('Interactive Cares'),
        subtitle: StarDisplayWidget(
          value: 4,
          filledStar: Icon(
            Icons.star,
            color: AppColors.primary,
            size: 15,
          ),
          unfilledStar: Icon(
            Icons.star,
            color: AppColors.primary.withOpacity(.5),
            size: 15,
          ),
        ),
      ),
    );
  }
}
