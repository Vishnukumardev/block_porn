import '../../core/utils/injections.dart';
import '../../shared/services/permission_services.dart';

void initHomeInjections() {
  if (!sl.isRegistered<PermissionService>()) {
    sl.registerLazySingleton<PermissionService>(() => PermissionService());
  }
}
