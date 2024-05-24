import 'package:flutter/material.dart';
import 'package:spenditure/const/color/app_colors.dart';

class QuickActionWidgets extends StatelessWidget {
  const QuickActionWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //profile picture
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.kPrimaryColor,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              fit: BoxFit.cover,
              'https://cdn.pixabay.com/photo/2024/03/16/10/29/ai-generated-8636784_1280.jpg',
              width: 30,
              height: 30,
            ),
          ),
        ),
        const Spacer(),
        //month
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.kPrimaryColor.withOpacity(0.3)),
          ),
          onPressed: () {},
          icon: const Icon(Icons.arrow_drop_down_rounded),
          label: const Text('October'),
        ),
        const Spacer(),
        const Icon(
          Icons.notifications,
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
