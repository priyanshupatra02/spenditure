import 'package:flutter/material.dart';
import 'package:spenditure/const/color/app_colors.dart';

class SecondaryActionButton extends StatelessWidget {
  const SecondaryActionButton({
    super.key,
    this.borderRadius,
    required this.labelText,
    required this.onPressed,
    this.color = AppColors.kOnPrimaryColor,
    this.icon = const Icon(Icons.download_rounded),
    this.isIcon = false,
    this.padding,
    this.freeSize = true,
    required this.secondaryText,
    this.fontWeight = FontWeight.w400,
  });
  final BorderRadiusGeometry? borderRadius;
  final String labelText;
  final String secondaryText;
  final VoidCallback onPressed;
  final Color? color;
  final Widget icon;
  final bool isIcon;

  final bool freeSize;
  final EdgeInsetsGeometry? padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        backgroundColor: color,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      icon: icon,
      label: RichText(
        text: TextSpan(
          text: labelText,
          style: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
            height: 1.3,
          ),
          children: [
            TextSpan(
              text: secondaryText,
              style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
