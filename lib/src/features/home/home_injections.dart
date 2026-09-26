import '../../core/utils/injections.dart';
import '../../shared/services/permission_services.dart';
import 'bloc/home_bloc.dart';

void initHomeInjections() {
  if (!sl.isRegistered<PermissionService>()) {
    sl.registerLazySingleton<PermissionService>(() => PermissionService());
  }

  if (!sl.isRegistered<HomeBloc>()) {
    sl.registerFactory<HomeBloc>(
      () => HomeBloc(permissionService: sl<PermissionService>()),
    );
  }
}
