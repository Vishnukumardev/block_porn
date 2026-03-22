import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppFontSize {
  static const xxSmall = 6.0;
  static const xSmall = 8.0;
  static const small = 12.0;
  static const medium = 16.0;
  static const large = 20.0;
  static const xLarge = 24.0;
  static const xxLarge = 28.0;
  static const xxxLarge = 32.0;
  static const xxxxLarge = 36.0;
}

class AppTextStyle {
  ///------ black ------///

  static const xxSmallBlack = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.xxSmall,
    fontWeight: FontWeight.w100, // Thin
    fontFamily: 'Public Sans Thin',
  );

  static const xSmallBlack = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.xSmall,
    fontWeight: FontWeight.w300, // Light
    fontFamily: 'Public Sans Light',
  );

  static const smallBlack = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.small,
    fontWeight: FontWeight.w400,
    fontFamily: 'Public Sans Regular',
  );

  static const mediumBlack = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.medium,
    fontWeight: FontWeight.w500,
    fontFamily: 'Public Sans Medium',
  );

  static const largeBlack = TextStyle(
    color: AppColors.black,
    fontSize: AppFontSize.large, // ✅
    fontWeight: FontWeight.w700, // ✅
    fontFamily: 'Public Sans Bold',
  );

  ///------ white ------///

  static const xxSmallWhite = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.xxSmall,
    fontWeight: FontWeight.w100, // Thin
    fontFamily: 'Public Sans Thin',
  );

  static const xSmallWhite = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.xSmall,
    fontWeight: FontWeight.w300, // Light
    fontFamily: 'Public Sans Light',
  );

  static const smallWhite = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.small,
    fontWeight: FontWeight.w400,
    fontFamily: 'Public Sans Regular',
  );

  static const mediumWhite = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.medium,
    fontWeight: FontWeight.w500, // Medium
    fontFamily: 'Public Sans Medium',
  );

  static const largeWhite = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.large,
    fontWeight: FontWeight.w700,
    fontFamily: 'Public Sans Bold',
  );
}