import 'package:block_porn/src/core/utils/constants/local_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

/// Light Theme
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.white,
  cardColor: AppColors.primaryColor,
  fontFamily: 'Urbanist Regular',

  // Clean ColorScheme setup ensures Material 3 works perfectly
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    surface: AppColors.white,
  ),

  // Fixed class name from DialogThemeData to DialogTheme
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.grey,
  ),

  // Optimized mappings avoiding runtime instantiation boilerplate
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 2,
    toolbarTextStyle: AppTextStyle.mediumBlack,
    titleTextStyle: AppTextStyle.largeBlack,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // For iOS
      statusBarIconBrightness: Brightness.dark, // For Android
    ),
  ),

  iconTheme: const IconThemeData(
    color: AppColors.black,
    size: 25,
  ),

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
      foregroundColor: AppColors.primaryColor, // Text/Icon color inside button
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      side: const BorderSide(color: AppColors.primaryColor, width: 1),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.transparent,
    filled: true,
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    showSelectedLabels: false,
    unselectedIconTheme: IconThemeData(
        color: AppColors.black
    ),
    selectedIconTheme: IconThemeData(
      size: iconSize,
      color: AppColors.black
    ),
    type: BottomNavigationBarType.fixed
  )
);

/// Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: AppColors.secondaryColor,
  scaffoldBackgroundColor: AppColors.black,
  cardColor: AppColors.secondaryColor,
  fontFamily: 'Urbanist Black',

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.secondaryColor,
    brightness: Brightness.dark,
    primary: AppColors.secondaryColor,
    secondary: AppColors.primaryColor,
    surface: AppColors.black,
  ),

  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.primaryColor,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black,
    surfaceTintColor: Colors.transparent,
    elevation: 2,
    toolbarTextStyle: AppTextStyle.mediumWhite,
    titleTextStyle: AppTextStyle.largeWhite,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark, // For iOS
      statusBarIconBrightness: Brightness.light, // For Android
    ),
  ),

  iconTheme: const IconThemeData(
    color: AppColors.white,
    size: 25,
  ),

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
      foregroundColor: AppColors.white, // Text/Icon color inside button
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      side: const BorderSide(color: AppColors.white, width: 1),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.transparent,
    filled: true,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedIconTheme: IconThemeData(
            color: AppColors.primaryColor
        ),
        selectedIconTheme: IconThemeData(
            size: 30.0,
            color: AppColors.primaryColor
        ),
        type: BottomNavigationBarType.fixed
    )
);
