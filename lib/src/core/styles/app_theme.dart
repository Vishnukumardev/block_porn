import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

///Light Theme

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  dialogTheme: const DialogThemeData(backgroundColor: AppColors.grey),
  cardColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 2,
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.largeBlack,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.largeBlack,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: 'Urbanist Regular',
  scaffoldBackgroundColor: AppColors.white,
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.largeBlack,
    headlineMedium: AppTextStyle.mediumBlack,
    headlineSmall: AppTextStyle.smallBlack,
    titleLarge: AppTextStyle.largeBlack,
    titleMedium: AppTextStyle.mediumBlack,
    titleSmall: AppTextStyle.smallBlack,
    bodyLarge: AppTextStyle.mediumBlack,
    bodyMedium: AppTextStyle.smallBlack,
    bodySmall: AppTextStyle.xSmallBlack,
    labelLarge: AppTextStyle.mediumBlack,
    labelMedium: AppTextStyle.smallBlack,
    labelSmall: AppTextStyle.xSmallBlack,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      side: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    suffixIconColor: AppColors.black,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.white, width: 1),
    ),
    errorMaxLines: 2,
  ),
);

///Dark Theme

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  primaryColor: AppColors.secondaryColor,
  dialogTheme: const DialogThemeData(backgroundColor: AppColors.primaryColor),
  cardColor: AppColors.secondaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    elevation: 2,
    toolbarTextStyle: const TextTheme(
      titleLarge: AppTextStyle.largeWhite,
    ).bodyLarge,
    titleTextStyle: const TextTheme(
      titleLarge: AppTextStyle.largeWhite,
    ).titleLarge,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  fontFamily: 'Urbanist Black',
  // scaffoldBackgroundColor: AppColors.black,
  iconTheme: const IconThemeData(color: AppColors.white, size: 25),
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.largeWhite,
    headlineMedium: AppTextStyle.mediumWhite,
    headlineSmall: AppTextStyle.smallWhite,
    titleLarge: AppTextStyle.largeWhite,
    titleMedium: AppTextStyle.mediumWhite,
    titleSmall: AppTextStyle.smallWhite,
    bodyLarge: AppTextStyle.mediumWhite,
    bodyMedium: AppTextStyle.smallWhite,
    bodySmall: AppTextStyle.xSmallWhite,
    labelLarge: AppTextStyle.smallWhite,
    labelMedium: AppTextStyle.smallWhite,
    labelSmall: AppTextStyle.smallWhite,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      side: const BorderSide(color: AppColors.white, width: 1),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    suffixIconColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.lightGrey, width: 1),
    ),
    errorMaxLines: 2,
  ),
);
