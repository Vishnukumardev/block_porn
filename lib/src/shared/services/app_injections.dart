import '../data/datasources/app_shared_preferences.dart';
import '../../core/utils/injections.dart';

initAppInjections() {
  sl.registerFactory<AppSharedPreferences>(() => AppSharedPreferences(sl()));
}
