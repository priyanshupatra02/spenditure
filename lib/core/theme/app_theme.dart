import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spenditure/const/color/app_colors.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  static ThemeData get lightTheme => FlexThemeData.light(
        // scheme: FlexScheme.materialBaseline,
        usedColors: 4,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 4,
        colorScheme: const ColorScheme.light(
          background: AppColors.kBackgroundColor, //scaffold bg
          primary:
              AppColors.kPrimaryColor, //buttons (floating action button), text-field border color
          onPrimary: AppColors.kOnPrimaryColor, //text on floating action button
          secondary: AppColors.kSecondaryColor, //buttons (elevated buttons)
          onSecondary: AppColors.kOnSecondaryColor, //text & icon on segmented buttons
          surface: AppColors.kSurfaceColor, //appbar, textfield bg
          onSurface: AppColors.kOnSurfaceColor, //text on scaffold's body
          outline: AppColors.kOutlineColor, //segmented button border, elevated button border
        ),
        // Define the text theme.
        textTheme: TextTheme(
          headlineSmall: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.kSecondaryBlackColor,
            fontSize: 20.0,
            letterSpacing: 0.5,
          ),
          titleLarge: const TextStyle(
            color: AppColors.kSecondaryBlackColor,
            fontSize: 16.0,
            letterSpacing: 0.5,
          ),
          labelLarge: TextStyle(
            fontSize: 13.0,
            color: AppColors.kGrey600,
            letterSpacing: 0.5,
          ),
        ),

        subThemesData: const FlexSubThemesData(
          //for all buttons size
          // buttonMinSize: Size(double.maxFinite, 56),
          //for elevated button styling
          elevatedButtonRadius: 16.0,
          elevatedButtonSecondarySchemeColor: SchemeColor.primary,
          elevatedButtonSchemeColor: SchemeColor.surface,
          elevatedButtonElevation: 0.0,
          elevatedButtonTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          //for textfield styling
          inputDecoratorRadius: 16.0,
          inputDecoratorBorderSchemeColor: SchemeColor.primary,

          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),

        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.inter().fontFamily,
      );
  static ThemeData get darkTheme => FlexThemeData.dark(
        // scheme: FlexScheme.materialBaseline,
        usedColors: 4,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        colorScheme: const ColorScheme.dark(
          background: AppColors.kBackgroundColor, //scaffold bg
          primary:
              AppColors.kPrimaryColor, //buttons (floating action button), text-field border color
          onPrimary: AppColors.kOnPrimaryColor, //text on floating action button
          secondary: AppColors.kSecondaryColor, //buttons (elevated buttons)
          onSecondary: AppColors.kOnSecondaryColor, //text & icon on segmented buttons
          surface: AppColors.kSurfaceColor, //appbar, textfield bg
          onSurface: AppColors.kOnSurfaceColor, //text on scaffold's body
          outline: AppColors.kOutlineColor, //segmented button border, elevated button border
        ),
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.inter().fontFamily,
      );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
