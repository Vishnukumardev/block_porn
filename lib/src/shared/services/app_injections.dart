
import '../../core/utils/injections.dart';
import '../data/sources/app_shared_preferences.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPreferences>(() => AppSharedPreferences(sl()));
}
