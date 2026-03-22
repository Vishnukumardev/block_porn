
import '../../core/utils/injections.dart';
import '../data/sources/app_shared_preferences.dart';

Future initAppInjections() async {
  sl.registerFactory<AppSharedPreferences>(() => AppSharedPreferences(sl()));
}
