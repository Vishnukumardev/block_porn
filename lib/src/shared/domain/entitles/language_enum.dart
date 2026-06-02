import '../../../../generated/l10n.dart';
import '../../../../main.dart';

enum LanguageEnum { en, es }

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.en:
        return 'en';
      case LanguageEnum.es:
        return 'es';
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.en:
        return 'en_US';
      case LanguageEnum.es:
        return 'es_ES';
    }
  }

  String get LangName {
    switch (this) {
      case LanguageEnum.en:
        return S.of(navigatorKey.currentContext!).english;
      case LanguageEnum.es:
        return S.of(navigatorKey.currentContext!).spanish;
    }
  }
}
