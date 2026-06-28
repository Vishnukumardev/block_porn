import '../../../shared/domain/entitles/language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/constants/local_constants.dart';

class AppSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSharedPreferences(this._sharedPreferences);

  LanguageEnum? getLang() {
    String? data = _sharedPreferences.getString(lang);
    if (data == null) {
      return LanguageEnum.en;
    }
    return LanguageEnum.values.firstWhere((element) => element.local == data);
  }

  void setLang(LanguageEnum language) {
    _sharedPreferences.setString(lang, language.local);
  }

  bool get isDarkTheme {
    final value = _sharedPreferences.getBool('isDarkTheme') ?? false;
    return value;
  }

  void setDarkTheme(bool isDark) {
    _sharedPreferences.setBool('isDarkTheme', isDark);
  }
}
