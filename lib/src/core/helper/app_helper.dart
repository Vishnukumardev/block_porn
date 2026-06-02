import 'package:flutter/material.dart';
import '../utils/injections.dart';
import '../../shared/domain/entitles/language_enum.dart';
import '../../shared/data/datasources/app_shared_preferences.dart';
import '../styles/app_colors.dart';

class AppHelper {
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPreferences>().getLang();
    return lang ?? LanguageEnum.en;
  }

  static bool isDarkTheme() {
    return sl<AppSharedPreferences>().isDarkTheme;
  }

  static void setDarkTheme(bool isDark) {
    return sl<AppSharedPreferences>().setDarkTheme(isDark);
  }

  static Widget getDivider() {
    return Divider(thickness: 0.8, color: AppColors.grey);
  }
}
