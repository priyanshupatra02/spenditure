import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spenditure/const/color/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    // this.borderRadius,
    required this.labelText,
    required this.onPressed,
    this.isLoading = false,
    // this.color,
    this.freeSize = false,
    this.fontSize = 12,
    this.isCTA = false,
    this.icon = const Icon(Icons.download_rounded),
    this.isIcon = false,
    this.isButtonActive,
  });
  // final BorderRadiusGeometry? borderRadius;
  final String labelText;
  final VoidCallback? onPressed;
  final bool isLoading;
  // final Color? color;
  final bool freeSize;
  final bool isCTA;
  final Widget? icon;
  final bool isIcon;
  final double fontSize;
  final bool? isButtonActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: borderRadius ?? BorderRadius.circular(25),
        //     ),
        backgroundColor: AppColors.kSecondaryColor,
        // minimumSize: freeSize ? const Size(0, 0) : const Size(double.infinity, 55),
      ),
      child: <Widget>[
        if (isLoading) const CupertinoActivityIndicator(),
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
        )
      ].hStack(alignment: MainAxisAlignment.center),
    );
    // : ElevatedButton(
    //     onPressed: onPressed,
    //     style: ElevatedButton.styleFrom(
    //       elevation: 0.0,
    //       shape: isCTA
    //           ? RoundedRectangleBorder(
    //               side: BorderSide(
    //                 color: AppColors.kPrimaryThemeColor.withOpacity(0.5),
    //                 width: 1.5,
    //               ),
    //               borderRadius: borderRadius ?? AppBorder.kFullMiddleCurve,
    //             )
    //           : RoundedRectangleBorder(
    //               borderRadius: borderRadius ?? AppBorder.kFullMiddleCurve,
    //             ),
    //       backgroundColor: color,
    //       minimumSize: freeSize ? const Size(0, 0) : const Size(double.infinity, 55),
    //     ),
    //     child: <Widget>[
    //       if (isLoading) const CupertinoActivityIndicator(),
    //       AppSmallText(
    //         text: labelText.toUpperCase(),
    //         fontWeight: FontWeight.w600,
    //         fontSize: fontSize,
    //       ).pOnly(left: 5),
    //     ].hStack(alignment: MainAxisAlignment.center),
    //   );
  }
}
