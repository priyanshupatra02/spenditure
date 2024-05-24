import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //background colors - (scaffold bg)
  static const Color kBackgroundColor = Colors.white;

  //primary colors buttons - (floating action button), text-field border color
  static const Color kPrimaryColor = Color(0xFF7F3DFF);
  static const Color kOnPrimaryColor = Colors.white;

  //appbar gradient
  static const Color kAppBarGradientStart = Color(0xFFFFF6E5);
  static const Color kAppBarGradientEnd = Color(0xFFF8EDD8);
  //secondary colors
  static const Color kSecondaryColor = Color(0xFFEEE5FF);
  static const Color kOnSecondaryColor = Color(0xFF7F3DFF);

  //surface colors
  static const Color kSurfaceColor = Colors.white;
  static const Color kOnSurfaceColor = Colors.black;

  //outline colors
  static const Color kOutlineColor = Color(0xFF7F3DFF);

  //alert colors
  static const Color kErrorColor = Color(0xFFFD3C4A);
  static const Color kSuccessColor = Color(0xFF00A86B);

  //grey colors
  static Color kGrey100 = Colors.grey.shade100;
  static Color kGrey200 = Colors.grey.shade200;
  static Color kGrey300 = Colors.grey.shade300;
  static Color kGrey400 = Colors.grey.shade400;
  static Color kGrey500 = Colors.grey.shade500;
  static Color kGrey600 = Colors.grey.shade600;
  static Color kGrey700 = Colors.grey.shade700;
  static Color kGrey800 = Colors.grey.shade800;
  static Color kGrey900 = Colors.grey.shade900;

  //other colors
  static const Color kSecondaryBlackColor = Color(0xFF0D0E0F);
}
