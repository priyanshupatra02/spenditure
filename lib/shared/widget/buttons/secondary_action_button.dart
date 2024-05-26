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
    this.isIcon = true,
    this.padding,
    this.freeSize = true,
    this.secondaryText,
    this.fontWeight,
  });
  final BorderRadiusGeometry? borderRadius;
  final String labelText;
  final String? secondaryText;
  final VoidCallback onPressed;
  final Color? color;
  final Widget icon;
  final bool isIcon;

  final bool freeSize;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return isIcon
        ? ElevatedButton.icon(
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
                  color: AppColors.kBackgroundColor,
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: secondaryText ?? 'secondaryText',
                    style: TextStyle(
                      color: AppColors.kBackgroundColor,
                      fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                      fontWeight: fontWeight ?? FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              // shape: const RoundedRectangleBorder(
              //     borderRadius: borderRadius ?? BorderRadius.circular(25),
              //     ),
              shape: const StadiumBorder(),
              backgroundColor: AppColors.kSecondaryColor,
              // minimumSize: freeSize ? const Size(0, 0) : const Size(double.infinity, 55),
            ),
            // child: <Widget>[
            // if (isLoading) const CupertinoActivityIndicator(),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                fontWeight: fontWeight ?? FontWeight.bold,
                letterSpacing: 0.4,
                color: AppColors.kPrimaryColor,
              ),
            ),
            // ].hStack(alignment: MainAxisAlignment.center),
          );
  }
}
