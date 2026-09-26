import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/injections.dart';
import '../data/sources/app_shared_preferences.dart';

Future initSharedInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
  sl.registerLazySingleton<AppSharedPreferences>(
    () => AppSharedPreferences(sl()),
  );
}
